import 'package:flutter_vss/feature/order/wayybill/view_model/state/wayybill_state.dart';
import 'package:flutter_vss/product/service/interface/wayybill_operation.dart';
import 'package:flutter_vss/product/service/model/order/order.dart';
import 'package:flutter_vss/product/state/base/base_cubit.dart';
import 'package:flutter_vss/product/state/container/product_state_items.dart';
import 'package:flutter_vss/product/utility/constants/project_strings.dart';

class WayybillViewModel extends BaseCubit<WayybillState> {
  WayybillViewModel({
    required WayyBillOperation wayyBillOperation,
    required Order order,
  })  : _wayyBillOperation = wayyBillOperation,
        _order = order,
        super(const WayybillState(isLoading: false));

  final WayyBillOperation _wayyBillOperation;
  final Order _order;

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

  /// Show error when fetch data from db is error exists
  void _showError(String? message) {
    if (message == null) return;
    ProductStateItems.toastService.showErrorMessage(message: message);
  }

  /// Change loading state
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }
}
