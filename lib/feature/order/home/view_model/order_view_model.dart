import 'package:flutter_vss/feature/order/home/view_model/state/order_state.dart';
import 'package:flutter_vss/product/cache/hive/hive_cache_operation.dart';
import 'package:flutter_vss/product/cache/shared/key/shared_keys.dart';
import 'package:flutter_vss/product/cache/shared/shared_cache_operation.dart';
import 'package:flutter_vss/product/service/interface/order_operation.dart';
import 'package:flutter_vss/product/service/model/order/order.dart';
import 'package:flutter_vss/product/state/base/base_cubit.dart';
import 'package:flutter_vss/product/state/container/product_state_items.dart';

final class OrderViewModel extends BaseCubit<OrderState> {
  OrderViewModel({
    required OrderOperation orderOperation,
    required HiveCacheOperation<Order> orderCacheOperation,
    required SharedCacheOperation sharedCacheOperation,
  })  : _orderOperation = orderOperation,
        _orderCacheOperation = orderCacheOperation,
        _sharedCacheOperation = sharedCacheOperation,
        super(const OrderState(isLoading: false));

  /// Order service
  final OrderOperation _orderOperation;

  /// Hive cache operation for orders
  final HiveCacheOperation<Order> _orderCacheOperation;

  /// Shared cache
  final SharedCacheOperation _sharedCacheOperation;

  /// Get orders from API
  Future<void> fetchOrdersFromDb() async {
    try {
      changeLoading();
      if (userId != null) {
        final result = await _orderOperation.getOrder(int.parse(userId!));
        if (result?.model?.errorCode == 1) {
          _showError(result?.model?.result);
        } else {
          final orders = result?.model?.orders ?? [];
          if (orders.isNotEmpty) {
            emit(state.copyWith(orders: orders));
          }
          _saveOrdersToCache(orders);
        }
      }
    } finally {
      changeLoading();
    }
  }

  /// Save orders to hive cache
  void _saveOrdersToCache(List<Order>? orders) {
    if (orders == null) return;
    _orderCacheOperation.addAll(orders);
  }

  /// Get Orders from cache
  void getAllOrdersFromCache() {
    try {
      changeLoading();
      final orders = _orderCacheOperation.getAll();
      emit(state.copyWith(orders: orders));
    } finally {
      changeLoading();
    }
  }

  void _showError(String? message) {
    if (message == null) return;
    ProductStateItems.toastService.showErrorMessage(message: message);
  }

  /// Get UserId from cache
  String? get userId => _sharedCacheOperation.get<String>(SharedKeys.userId);

  /// Change loading state
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }
}
