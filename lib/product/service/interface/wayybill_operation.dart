// ignore_for_file: public_member_api_docs

import 'package:dio_nexus/dio_nexus.dart';
import 'package:flutter_vss/product/service/model/wayybill/wayybill.dart';

abstract class WayyBillOperation {
  Future<IResponseModel<WayyBill?>?> getWayyBill(String siparisNumarasi);
}
