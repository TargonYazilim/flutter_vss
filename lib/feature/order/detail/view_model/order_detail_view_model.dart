// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_vss/product/utility/barcode/custom_barcode_scanner.dart';

class OrderDetailViewModel {
  OrderDetailViewModel({
    required CustomBarcodeScanner barcodeScanner,
  }) : _barcodeScanner = barcodeScanner;
  late CustomBarcodeScanner _barcodeScanner;

  Future<void> scanBarcode() async {
    var result = await _barcodeScanner.scan(ScanMode.BARCODE);
    if (result.scanResult != null) {
      print(result.scanResult);
    } else {
      print(result.errorMessage);
    }
  }
}
