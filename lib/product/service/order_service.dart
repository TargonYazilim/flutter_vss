import 'package:dio_nexus/dio_nexus.dart';
import 'package:flutter_vss/product/service/interface/order_operation.dart';
import 'package:flutter_vss/product/service/manager/enums/query_parameters_enum.dart';
import 'package:flutter_vss/product/service/manager/product_service_path.dart';
import 'package:flutter_vss/product/service/model/order/order_barcode_scan_response.dart';
import 'package:flutter_vss/product/service/model/order/order_detail_response.dart';
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
  Future<IResponseModel<OrderDetailResponse?>?> getOrderDetail(
    String siparisNumarasi,
  ) async {
    return _dioNexusManager
        .sendRequest<OrderDetailResponse, OrderDetailResponse>(
      ProductServicePath.getOrderDetail.value,
      queryParameters: {
        QueryParametersEnum.siparisNumarasi.name: siparisNumarasi,
      },
      responseModel: OrderDetailResponse(),
      requestType: RequestType.GET,
    );
  }

  @override
  Future<IResponseModel<OrderBarcodeScanResponse?>?> scanOrderBarcode(
    String barcode,
    String siparisNumarasi,
    String malzemeKodu,
  ) async {
    return _dioNexusManager
        .sendRequest<OrderBarcodeScanResponse, OrderBarcodeScanResponse>(
      ProductServicePath.scanOrderBarcode.value,
      queryParameters: {
        QueryParametersEnum.barkod.name: barcode,
        QueryParametersEnum.siparisNumarasi.name: siparisNumarasi,
        QueryParametersEnum.malzemeKodu.name: malzemeKodu,
      },
      responseModel: OrderBarcodeScanResponse(),
      requestType: RequestType.GET,
    );
  }
}
