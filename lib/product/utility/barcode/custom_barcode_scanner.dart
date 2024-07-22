import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_vss/product/utility/barcode/barcode_scanner_response.dart';
import 'package:flutter_vss/product/utility/constants/project_strings.dart';

final class CustomBarcodeScanner {
  Future<BarcodeScannerResponse> scan(ScanMode scanMode) async {
    if (scanMode == ScanMode.BARCODE) {
      return await _scanBarcode();
    } else {
      throw Exception('QR Scanner does not initialize');
    }
  }

  Future<BarcodeScannerResponse> _scanBarcode() async {
    String? barcodeScanRes;

    try {
      barcodeScanRes = barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', ProjectStrings.cancel, true, ScanMode.BARCODE);

      return BarcodeScannerResponse(
          scanResult: barcodeScanRes, errorMessage: null);
    } on PlatformException {
      return BarcodeScannerResponse(
          scanResult: null, errorMessage: 'Platform sürümü alınamadı.');
    } catch (error) {
      return BarcodeScannerResponse(
          scanResult: null, errorMessage: 'Bir hata oluştu!');
    }
  }
}
