//LoginLogin

import 'package:dio_nexus/dio_nexus.dart';
import 'package:flutter_vss/product/service/interface/authentication_operation.dart';
import 'package:flutter_vss/product/service/manager/product_service_path.dart';
import 'package:flutter_vss/product/service/model/login/login.dart';
import 'package:flutter_vss/product/service/model/login/login_response.dart';

final class LoginService extends AuthenticationOperation {
  LoginService(IDioNexusManager dioNexusManager)
      : _dioNexusManager = dioNexusManager;
  final IDioNexusManager _dioNexusManager;

  @override
  Future<IResponseModel<LoginResponse?>?> login(Login login) async {
    return  _dioNexusManager.sendRequest<LoginResponse, LoginResponse>(
      ProductServicePath.login.value,
      responseModel: LoginResponse(),
      data: login,
      requestType: RequestType.POST,
    );
  }
}
