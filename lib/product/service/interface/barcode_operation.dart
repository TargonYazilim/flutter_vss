import 'package:dio_nexus/dio_nexus.dart';
import 'package:flutter_vss/product/service/model/barcode/barcode_response.dart';

abstract class BarcodeOperation {
  Future<IResponseModel<BarcodeResponse?>?> barcodes();
}
