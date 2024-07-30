import 'package:dio_nexus/dio_nexus.dart';
import 'package:flutter_vss/product/service/interface/order_operation.dart';
import 'package:flutter_vss/product/service/manager/product_service_path.dart';
import 'package:flutter_vss/product/service/model/order/order_response.dart';

final class OrderService extends OrderOperation {
  OrderService(IDioNexusManager dioNexusManager)
      : _dioNexusManager = dioNexusManager;
  final IDioNexusManager _dioNexusManager;

  @override
  Future<IResponseModel<OrderResponse?>?> getOrder(int logicalref) async {
    return await _dioNexusManager.sendRequest<OrderResponse, OrderResponse>(
      ProductServicePath.getOrder.value,
      queryParameters: {"LOGICALREF": logicalref},
      responseModel: OrderResponse(),
      requestType: RequestType.GET,
    );
  }
}
