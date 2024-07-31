// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_vss/feature/order/detail/view_model/state/order_detail_state.dart';
import 'package:flutter_vss/product/service/interface/order_operation.dart';
import 'package:flutter_vss/product/state/base/base_cubit.dart';
import 'package:flutter_vss/product/state/container/product_state_items.dart';
import 'package:flutter_vss/product/utility/barcode/custom_barcode_scanner.dart';

class OrderDetailViewModel extends BaseCubit<OrderDetailState> {
  OrderDetailViewModel({
    required CustomBarcodeScanner barcodeScanner,
    required OrderOperation orderOperation,
    required String siparisNumarasi,
  })  : _barcodeScanner = barcodeScanner,
        _orderOperation = orderOperation,
        _siparisNumarasi = siparisNumarasi,
        super(const OrderDetailState(isLoading: false));

  late final CustomBarcodeScanner _barcodeScanner;
  final OrderOperation _orderOperation;
  late final String _siparisNumarasi;

  Future<void> fetchOrderDetails() async {
    try {
      changeLoading();

      final result = await _orderOperation.getOrderDetail(_siparisNumarasi);
      if (result?.model?.errorCode == 1) {
        _showError(result?.model?.result);
      } else {
        emit(state.copyWith(orderDetailResponse: result!.model));
        //return _saveItems(result?.model);
      }
    } finally {
      changeLoading();
    }
  }

  Future<void> scanBarcode() async {
    final result = await _barcodeScanner.scan(ScanMode.BARCODE);
    if (result.scanResult != null) {
      print(result.scanResult);
    } else {
      print(result.errorMessage);
    }
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
