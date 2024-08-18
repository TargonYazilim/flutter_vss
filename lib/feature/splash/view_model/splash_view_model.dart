// ignore_for_file: public_member_api_docs

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vss/feature/splash/view_model/state/splash_state.dart';
import 'package:flutter_vss/product/cache/hive/hive_cache_operation.dart';
import 'package:flutter_vss/product/service/interface/barcode_operation.dart';
import 'package:flutter_vss/product/service/interface/order_operation.dart';
import 'package:flutter_vss/product/service/model/barcode/barcode.dart';
import 'package:flutter_vss/product/service/model/order/order.dart';
import 'package:flutter_vss/product/service/model/order/order_detail.dart';

final class SplashViewModel extends Cubit<SplashState> {
  SplashViewModel({
    required OrderOperation orderOperation,
    required BarcodeOperation barcodeOperation,
    required HiveCacheOperation<Barcode> barcodeCacheOperation,
    required HiveCacheOperation<Order> orderCacheOperation,
  })  : _barcodeOperation = barcodeOperation,
        _barcodeCacheOperation = barcodeCacheOperation,
        _orderCacheOperation = orderCacheOperation,
        _orderOperation = orderOperation,
        super(const SplashState(isLoading: false));

  /// Order service
  final OrderOperation _orderOperation;

  /// Hive cache operation for orders
  final HiveCacheOperation<Order> _orderCacheOperation;

  /// Barcode Service
  final BarcodeOperation _barcodeOperation;

  /// Hive barcode cache operation
  final HiveCacheOperation<Barcode> _barcodeCacheOperation;

  Future<void> getBarcodesFromDb() async {
    final result = await _barcodeOperation.barcodes();
    _saveBarcodes(result?.model?.items);
  }

  /// Save barcodes to hive cache
  void _saveBarcodes(List<Barcode>? barcodes) {
    if (barcodes == null) return;
    _barcodeCacheOperation.addAll(barcodes);
  }

  /// Get orders from API
  Future<void> getOrdersFromDb(String? userId) async {
    if (userId != null) {
      bool areDatasSynchronized = true;
      // Sunucudan siparişleri al
      final result = await _orderOperation.getOrder(int.parse(userId));

      // Cache'den siparişleri al
      final ordersFromCache = _orderCacheOperation.getAll();

      final orders = result?.model?.orders ?? [];

      if (orders.isNotEmpty) {
        for (final order in orders) {
          if (order.orderDetails != null && order.orderDetails!.isNotEmpty) {
            // Sunucudan gelen siparişle cache'deki siparişi eşleştir
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

                // Eğer cache'de scan varsa ve sunucudan gelen boşsa, sunucudan geleni temizle
                if (cachedDetail.scans != null &&
                    cachedDetail.scans!.isNotEmpty &&
                    (orderDetail.scans == null || orderDetail.scans!.isEmpty)) {
                  orderDetail.scans = cachedDetail.scans;
                  areDatasSynchronized = false;
                }
                // Eğer sunucudan gelen scan varsa ve cache'de yoksa, sunucudan geleni temizle
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
      if (!areDatasSynchronized) {
        await _orderOperation.saveScanOrders(orders);
      }
      //TODO: Eğer if'in içerisine girdiyse. Veriyi local'e kayıt etmeden önce mevcut veriyi sunucuya gönder
      _saveOrdersToCache(orders);
    }
  }

  /// Save orders to hive cache
  void _saveOrdersToCache(List<Order>? orders) {
    if (orders == null) return;
    _orderCacheOperation.addAll(orders);
  }
}
