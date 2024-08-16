import 'package:dio_nexus/dio_nexus.dart';
import 'package:flutter_vss/product/service/interface/wayybill_operation.dart';
import 'package:flutter_vss/product/service/manager/enums/query_parameters_enum.dart';
import 'package:flutter_vss/product/service/manager/product_service_path.dart';
import 'package:flutter_vss/product/service/model/wayybill/wayybill.dart';

final class WayyBillService extends WayyBillOperation {
  WayyBillService(IDioNexusManager dioNexusManager)
      : _dioNexusManager = dioNexusManager;
  final IDioNexusManager _dioNexusManager;

  @override
  Future<IResponseModel<WayyBill?>?> getWayyBill(String siparisNumarasi) {
    return _dioNexusManager.sendRequest<WayyBill, WayyBill>(
      ProductServicePath.getWayybill.value,
      queryParameters: {
        QueryParametersEnum.siparisNumarasi.name: siparisNumarasi,
      },
      responseModel: WayyBill(),
      requestType: RequestType.GET,
    );
  }
}
