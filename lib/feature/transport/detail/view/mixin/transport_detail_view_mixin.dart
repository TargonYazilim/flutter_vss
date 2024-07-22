import 'package:flutter/material.dart';
import 'package:flutter_vss/feature/transport/detail/view/transport_detail_view.dart';
import 'package:flutter_vss/feature/transport/detail/view_model/transport_detail_view_model.dart';
import 'package:flutter_vss/product/utility/barcode/custom_barcode_scanner.dart';

mixin TransportDetailViewMixin on State<TransportDetailView> {
  late TransportDetailViewModel _transportDetailViewModel;

  TransportDetailViewModel get viewModel => _transportDetailViewModel;

  @override
  void initState() {
    super.initState();

    _transportDetailViewModel = TransportDetailViewModel(
      barcodeScanner: CustomBarcodeScanner(),
    );
  }
}
