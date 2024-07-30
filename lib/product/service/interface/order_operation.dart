import 'package:dio_nexus/dio_nexus.dart';
import 'package:flutter_vss/product/service/model/order/order_response.dart';

abstract class OrderOperation {
  Future<IResponseModel<OrderResponse?>?> getOrder(int logicalref);
}
