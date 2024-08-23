import 'package:flutter_vss/feature/order/wayybill/view_model/state/wayybill_state.dart';
import 'package:flutter_vss/product/cache/hive/hive_cache_operation.dart';
import 'package:flutter_vss/product/cache/shared/key/shared_keys.dart';
import 'package:flutter_vss/product/cache/shared/shared_cache_operation.dart';
import 'package:flutter_vss/product/service/interface/order_operation.dart';
import 'package:flutter_vss/product/service/interface/wayybill_operation.dart';
import 'package:flutter_vss/product/service/model/login/login_response.dart';
import 'package:flutter_vss/product/service/model/order/order.dart';
import 'package:flutter_vss/product/state/base/base_cubit.dart';
import 'package:flutter_vss/product/state/container/product_state_items.dart';
import 'package:flutter_vss/product/utility/constants/project_strings.dart';

class WayybillViewModel extends BaseCubit<WayybillState> {
  WayybillViewModel({
    required WayyBillOperation wayyBillOperation,
    required Order order,
    required OrderOperation orderOperation,
    required HiveCacheOperation<Order> orderCacheOperation,
    required HiveCacheOperation<LoginResponse> loginResponseCacheOperation,
    required SharedCacheOperation sharedCacheOperation,
  })  : _wayyBillOperation = wayyBillOperation,
        _orderCacheOperation = orderCacheOperation,
        _loginResponseCacheOperation = loginResponseCacheOperation,
        _orderOperation = orderOperation,
        _sharedCacheOperation = sharedCacheOperation,
        _order = order,
        super(const WayybillState(isLoading: false));

  /// Hive cache operation for orders
  final HiveCacheOperation<Order> _orderCacheOperation;

  /// Hive cache operation for login response
  final HiveCacheOperation<LoginResponse> _loginResponseCacheOperation;

  final SharedCacheOperation _sharedCacheOperation;

  final OrderOperation _orderOperation;
  final WayyBillOperation _wayyBillOperation;
  Order _order;

  Future<void> getWayyBill() async {
    try {
      changeLoading();
      final result =
          await _wayyBillOperation.getWayyBill(_order.siparisNumarasi!);
      if (result?.errorModel == null && result?.model != null) {
        emit(state.copyWith(wayyBill: result!.model));
      } else {
        _showError(
          result?.errorModel?.errorMessage ?? ProjectStrings.somethingError,
        );
      }
    } finally {
      changeLoading();
    }
  }

  /// Save order details to hive cache
  Future<void> saveOrdersToService() async {
    final result = await _orderOperation.saveScanOrders([_order]);

    /// Eğer backend'e veri başarılı bir şekilde kayıt edilmişse
    /// [_order.copyWith(synchronized: true)]
    /// ile veriyi synchronize olarak işaretle
    if (result?.errorModel == null && result?.model != null) {
      for (final siparisNo in result!.model!) {
        if (siparisNo.siparisNumarasi == _order.siparisNumarasi) {
          _order = _order.copyWith(synchronized: true);
        } else {
          _order = _order.copyWith(synchronized: false);
        }
      }
    }
    _orderCacheOperation.update(_order);
  }

  /// Show error when fetch data from db is error exists
  void _showError(String? message) {
    if (message == null) return;
    ProductStateItems.toastService.showErrorMessage(message: message);
  }

  /// Get Company address info from login response cache
  void getAddressInfo() {
    final address = _loginResponseCacheOperation.get(_userId!)?.addressInfo;
    emit(state.copyWith(addressInfo: address));
  }

  /// Get UserId from cache
  String? get _userId => _sharedCacheOperation.get(SharedKeys.userId);

  /// Change loading state
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }
}
