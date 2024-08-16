import 'package:dio_nexus/dio_nexus.dart';
import 'package:flutter_vss/product/service/interface/scan_operation.dart';
import 'package:flutter_vss/product/service/manager/enums/query_parameters_enum.dart';
import 'package:flutter_vss/product/service/manager/product_service_path.dart';

final class ScanService extends ScanOperation {
  ScanService(IDioNexusManager dioNexusManager)
      : _dioNexusManager = dioNexusManager;
  final IDioNexusManager _dioNexusManager;

  @override
  Future<IResponseModel<NexusModel<bool>?>?> removeBarcodeScan(
      String scanId) async {
    return _dioNexusManager.sendRequest<NexusModel<bool>, NexusModel<bool>>(
      ProductServicePath.removeBarcodeScan.value,
      queryParameters: {QueryParametersEnum.scanId.name: scanId},
      responseModel: NexusModel<bool>(),
      requestType: RequestType.DELETE,
    );
  }
}
