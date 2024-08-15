// ignore_for_file: public_member_api_docs

import 'package:dio_nexus/dio_nexus.dart';
import 'package:flutter_vss/product/service/model/barcode/scan_barcode_response.dart';
import 'package:flutter_vss/product/service/model/order/order.dart';
import 'package:flutter_vss/product/service/model/order/order_response.dart';

abstract class OrderOperation {
  Future<IResponseModel<OrderResponse?>?> getOrder(int logicalref);
  Future<IResponseModel<List<ScanBarcodeResponse>?>?> saveScanOrders(
    List<Order> orders,
  );
}
