import 'package:dio_nexus/dio_nexus.dart';
import 'package:flutter_vss/product/service/interface/order_operation.dart';
import 'package:flutter_vss/product/service/manager/enums/query_parameters_enum.dart';
import 'package:flutter_vss/product/service/manager/product_service_path.dart';
import 'package:flutter_vss/product/service/model/barcode/scan_barcode_response.dart';
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
  Future<IResponseModel<List<ScanBarcodeResponse>?>?> saveScanOrders(
    List<Order> orders,
  ) async {
    return _dioNexusManager
        .sendRequest<ScanBarcodeResponse, List<ScanBarcodeResponse>?>(
      ProductServicePath.saveScanOrder.value,
      responseModel: ScanBarcodeResponse(),
      data: orders,
      requestType: RequestType.POST,
    );
  }
}
