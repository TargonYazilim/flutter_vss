// ignore_for_file: public_member_api_docs

import 'package:dio_nexus/dio_nexus.dart';
import 'package:flutter_vss/product/service/model/order/order_barcode_scan_response.dart';
import 'package:flutter_vss/product/service/model/order/order_detail_response.dart';
import 'package:flutter_vss/product/service/model/order/order_response.dart';

abstract class OrderOperation {
  Future<IResponseModel<OrderResponse?>?> getOrder(int logicalref);
  Future<IResponseModel<OrderDetailResponse?>?> getOrderDetail(
    String siparisNumarasi,
  );
  Future<IResponseModel<OrderBarcodeScanResponse?>?> scanOrderBarcode(
    String barcode,
    String siparisNumarasi,
    String malzemeKodu,
  );
}
