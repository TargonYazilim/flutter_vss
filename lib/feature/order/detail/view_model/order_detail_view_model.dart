// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_vss/feature/order/detail/view_model/state/order_detail_state.dart';
import 'package:flutter_vss/product/service/interface/order_operation.dart';
import 'package:flutter_vss/product/service/model/order/order.dart';
import 'package:flutter_vss/product/service/model/order/order_detail.dart';
import 'package:flutter_vss/product/state/base/base_cubit.dart';
import 'package:flutter_vss/product/state/container/product_state_items.dart';
import 'package:flutter_vss/product/utility/barcode/custom_barcode_scanner.dart';
import 'package:flutter_vss/product/utility/constants/project_strings.dart';

class OrderDetailViewModel extends BaseCubit<OrderDetailState> {
  OrderDetailViewModel({
    required CustomBarcodeScanner barcodeScanner,
    required OrderOperation orderOperation,
    required Order order,
  })  : _barcodeScanner = barcodeScanner,
        _orderOperation = orderOperation,
        _order = order,
        super(const OrderDetailState(isLoading: false));

  late final CustomBarcodeScanner _barcodeScanner;
  final OrderOperation _orderOperation;
  late final Order _order;

  Future<void> fetchOrderDetails() async {
    try {
      changeLoading();

      final result =
          await _orderOperation.getOrderDetail(_order.siparisNumarasi ?? '');
      if (result?.model?.errorCode == 1) {
        _showError(result?.model?.result);
      } else {
        emit(state.copyWith(orderDetails: result?.model?.orderLines ?? []));
        //return _saveItems(result?.model);
      }
    } finally {
      changeLoading();
    }
  }

  Future<void> scanBarcode(int index) async {
    //updateBarcode(index, '210 kg');

    final result = await _barcodeScanner.scan(ScanMode.BARCODE);
    if (result.scanResult != null) {
      final response = await _orderOperation.scanOrderBarcode(
        '2823306',
        _order.siparisNumarasi ?? '',
        state.orderDetails?[index].malzemeKodu ?? '',
      );
      if (response?.model?.errorCode == 1) {
        _showError(response?.model?.result);
      } else {
        updateBarcode(index, response?.model?.items?.first.kilo);
      }
    } else {
      ProductStateItems.toastService
          .showInfoMessage(message: ProjectStrings.scanBarcodeFailed);
    }
  }

  void updateBarcode(int index, String? kg) {
    if (kg == null) return;
    final newOrderList = <OrderDetail>[...state.orderDetails ?? []];
    final updatedOrderDetail = newOrderList[index].copyWith(scanResult: kg);
    newOrderList[index] = updatedOrderDetail;
    emit(state.copyWith(orderDetails: newOrderList));
  }

  void _showError(String? message) {
    if (message == null) return;
    ProductStateItems.toastService.showErrorMessage(message: message);
  }

  /// Change loading state
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }
}
