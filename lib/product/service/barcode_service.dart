// ignore_for_file: public_member_api_docs

import 'package:dio_nexus/dio_nexus.dart';
import 'package:flutter_vss/product/service/interface/barcode_operation.dart';
import 'package:flutter_vss/product/service/manager/product_service_path.dart';
import 'package:flutter_vss/product/service/model/barcode/barcode_response.dart';

final class BarcodeService extends BarcodeOperation {
  BarcodeService({required IDioNexusManager dioNexusManager})
      : _dioNexusManager = dioNexusManager;
  final IDioNexusManager _dioNexusManager;
  @override
  Future<IResponseModel<BarcodeResponse?>?> barcodes() {
      return _dioNexusManager.sendRequest<BarcodeResponse, BarcodeResponse>(
      ProductServicePath.getBarcodes.value,
      responseModel: BarcodeResponse(),
      requestType: RequestType.GET,
    );
  }
}
