import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vss/feature/order/home/view_model/state/order_state.dart';
import 'package:flutter_vss/product/cache/hive/hive_cache_operation.dart';
import 'package:flutter_vss/product/cache/model/user_cache_model.dart';
import 'package:flutter_vss/product/cache/shared/key/shared_keys.dart';
import 'package:flutter_vss/product/cache/shared/shared_cache_operation.dart';
import 'package:flutter_vss/product/service/interface/order_operation.dart';
import 'package:flutter_vss/product/service/model/login/login_response.dart';
import 'package:flutter_vss/product/state/container/product_state_items.dart';

final class OrderViewModel extends Cubit<OrderState> {
  OrderViewModel({
    required OrderOperation orderOperation,
    required HiveCacheOperation<LoginResponseCacheModel>
        loginResponseCacheOperation,
    required SharedCacheOperation sharedCacheOperation,
  })  : _orderOperation = orderOperation,
        _loginResponseCacheOperation = loginResponseCacheOperation,
        _sharedCacheOperation = sharedCacheOperation,
        super(OrderState(isLoading: false));

  final OrderOperation _orderOperation;
  final HiveCacheOperation<LoginResponseCacheModel>
      _loginResponseCacheOperation;
  final SharedCacheOperation _sharedCacheOperation;

  Future<void> fetchOrders() async {
    try {
      changeLoading();

      if (userId != null) {
        var result = await _orderOperation.getOrder(int.parse(userId!));
        print(result);
        if (result?.model?.errorCode == 1)
          _showError(result?.model?.result);
        else {
          emit(state.copyWith(orderResponse: result!.model));
          //return _saveItems(result?.model);
        }
      }
    } finally {
      changeLoading();
    }
  }

  /// Save users to hive cache
  bool _saveItems(LoginResponse? loginResponse) {
    print("Login ? = ${loginResponse}");
    if (loginResponse == null) return false;
    _loginResponseCacheOperation
        .add(LoginResponseCacheModel(loginResponse: loginResponse));
    return true;
  }

  void _showError(String? message) {
    if (message == null) return;
    ProductStateItems.toastService.showErrorMessage(message: message);
  }

  String? get userId => _sharedCacheOperation.get(SharedKeys.userId);

  /// Change loading state
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }
}
