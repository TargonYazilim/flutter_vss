// ignore_for_file: public_member_api_docs

import 'package:dio_nexus/dio_nexus.dart';

abstract class ScanOperation {
  Future<IResponseModel<NexusModel<bool>?>?> removeBarcodeScan(String scanId);
}
