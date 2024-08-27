import 'package:flutter/foundation.dart';
import 'package:flutter_vss/product/cache/hive/hive_cache_operation.dart';
import 'package:flutter_vss/product/cache/shared/key/shared_keys.dart';
import 'package:flutter_vss/product/cache/shared/shared_cache_operation.dart';
import 'package:flutter_vss/product/service/barcode_service.dart';
import 'package:flutter_vss/product/service/interface/barcode_operation.dart';
import 'package:flutter_vss/product/service/interface/order_operation.dart';
import 'package:flutter_vss/product/service/manager/order/synchronize_cache_operation.dart';
import 'package:flutter_vss/product/service/model/barcode/barcode.dart';
import 'package:flutter_vss/product/service/model/order/order.dart';
import 'package:flutter_vss/product/service/model/order/order_detail.dart';
import 'package:flutter_vss/product/service/order_service.dart';
import 'package:flutter_vss/product/state/container/product_state_items.dart';

@immutable

/// SynchronizeCacheData
final class SynchronizeCacheManager extends ISynchronizeCacheOperation {
  SynchronizeCacheManager() {
    _orderOperation = OrderService(ProductStateItems.productNetworkManager);
    _barcodeOperation = BarcodeService(ProductStateItems.productNetworkManager);
    _orderCacheOperation = ProductStateItems.productCache.orderCacheModel;
    _barcodeCacheOperation = ProductStateItems.productCache.barcodeCacheModel;
    _sharedCacheOperation = ProductStateItems.productSharedCache;
  }

  /// Order service
  late final OrderOperation _orderOperation;

  /// Hive cache operation for orders
  late final HiveCacheOperation<Order> _orderCacheOperation;

  /// Hive barcode cache operation
  late final HiveCacheOperation<Barcode> _barcodeCacheOperation;

  /// Shared cache operation
  late final SharedCacheOperation _sharedCacheOperation;

  /// Barcode Service
  late final BarcodeOperation _barcodeOperation;

  @override
  Future<void> synchronizeOrders() async {
    if (userId != null) {
      var areDatasSynchronized = true;

      /// Sunucudan siparişleri al
      final result = await _orderOperation.getOrder(int.parse(userId!));

      /// Cache'den siparişleri al
      var ordersFromCache = _orderCacheOperation.getAll();

      /// Delete old order caches
      final deleted =
          _clearAllOldCacheOrders(result?.model?.date, ordersFromCache);
      if (deleted) {
        /// Get orders from cache, if any order deleted from cache
        /// because of [ordersFromCache] have to refresh
        ordersFromCache = _orderCacheOperation.getAll();
      }
      final orders = result?.model?.orders ?? [];

      if (orders.isNotEmpty) {
        for (final order in orders) {
          if (order.orderDetails != null && order.orderDetails!.isNotEmpty) {
            /// Sunucudan gelen siparişle cache'deki siparişi eşleştir
            final cachedOrder = ordersFromCache.firstWhere(
              (o) => o.siparisLogicalRef == order.siparisLogicalRef,
              orElse: Order.empty,
            );

            if (cachedOrder.orderDetails != null) {
              for (final orderDetail in order.orderDetails!) {
                // Cache'deki sipariş detayını bul
                final cachedDetail = cachedOrder.orderDetails!.firstWhere(
                  (d) => d.siparisId == orderDetail.siparisId,
                  orElse: OrderDetail.empty,
                );

                /// Eğer cache'de scan varsa ve sunucudan gelen boşsa,
                /// sunucudan geleni temizle
                if (cachedDetail.scans != null &&
                    cachedDetail.scans!.isNotEmpty) {
                  orderDetail.scans = cachedDetail.scans;
                  areDatasSynchronized = false;
                }

                /// Eğer sunucudan gelen scan varsa ve cache'de yoksa,
                /// sunucudan geleni temizle
                else if (cachedDetail.scans == null ||
                    cachedDetail.scans!.isEmpty) {
                  orderDetail.scans?.clear();
                  areDatasSynchronized = false;
                }
              }
            }
          }
        }
      }

      /// Synchronize caches datas with API
      if (!areDatasSynchronized) {
        await _orderOperation.saveScanOrders(orders);
      }
      _saveOrdersToCache(orders);
    }
  }

  bool _clearAllOldCacheOrders(
    DateTime? dateFromServer,
    List<Order> ordersFromCache,
  ) {
    var anyDataDeleted = false;
    if (ordersFromCache.isEmpty || dateFromServer == null) return false;
    for (final order in ordersFromCache) {
      final cacheDate = DateTime.parse(order.siparisTarihi!);
      final serverDate = dateFromServer.toLocal();
      if (cacheDate.year != serverDate.year ||
          cacheDate.month != serverDate.month ||
          cacheDate.day != serverDate.day) {
        /// Clear order from cache, if date not equals today
        _orderCacheOperation.remove(order.cacheId);
        anyDataDeleted = true;
      }
    }

    return anyDataDeleted;
  }

  @override
  Future<void> synchronizeBarcodes() async {
    final result = await _barcodeOperation.barcodes();
    _saveBarcodes(result?.model?.items);
  }

  /// Save orders to hive cache
  void _saveOrdersToCache(List<Order>? orders) {
    if (orders == null) return;
    _orderCacheOperation.addAll(orders);
  }

  /// Save barcodes to hive cache
  void _saveBarcodes(List<Barcode>? barcodes) {
    if (barcodes == null) return;
    _barcodeCacheOperation.addAll(barcodes);
  }

  /// UserId from cache
  String? get userId => _sharedCacheOperation.get(SharedKeys.userId);
}
