import 'package:dio_nexus/dio_nexus.dart';
import 'package:flutter_vss/product/service/interface/order_operation.dart';
import 'package:flutter_vss/product/service/manager/enums/query_parameters_enum.dart';
import 'package:flutter_vss/product/service/manager/product_service_path.dart';
import 'package:flutter_vss/product/service/model/order/order.dart';
import 'package:flutter_vss/product/service/model/order/order_response.dart';

final class OrderService extends OrderOperation {
  OrderService(IDioNexusManager dioNexusManager)
      : _dioNexusManager = dioNexusManager;
  final IDioNexusManager _dioNexusManager;

  @override
  Future<IResponseModel<OrderResponse?>?> getOrder(int logicalref) async {
    return _dioNexusManager.sendRequest<OrderResponse, OrderResponse>(
      ProductServicePath.getOrder.value,
      queryParameters: {QueryParametersEnum.LOGICALREF.name: logicalref},
      responseModel: OrderResponse(),
      requestType: RequestType.GET,
    );
  }

  @override
  Future<IResponseModel<List<String>?>?> saveScanOrders(
    List<Order> orders,
  ) async {
    final resp = await _dioNexusManager
        .sendRequest<NexusModel<List<String>>, List<String>>(
      ProductServicePath.saveScanOrder.value,
      responseModel: NexusModel<List<String>>(),
      data: orders,
      requestType: RequestType.POST,
    );
    print(resp);
    return null;
  }
}
