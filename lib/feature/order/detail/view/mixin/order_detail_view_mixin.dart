import 'package:flutter/material.dart';
import 'package:flutter_vss/feature/order/detail/view/order_detail_view.dart';
import 'package:flutter_vss/feature/order/detail/view_model/order_detail_view_model.dart';
import 'package:flutter_vss/product/utility/barcode/custom_barcode_scanner.dart';

mixin OrderDetailViewMixin on State<OrderDetailView> {
  late OrderDetailViewModel _orderDetailViewModel;

  OrderDetailViewModel get viewModel => _orderDetailViewModel;

  @override
  void initState() {
    super.initState();

    _orderDetailViewModel = OrderDetailViewModel(
      barcodeScanner: CustomBarcodeScanner(),
    );
  }
}
