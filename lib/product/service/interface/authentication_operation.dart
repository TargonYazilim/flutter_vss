import 'package:dio_nexus/dio_nexus.dart';
import 'package:flutter_vss/product/service/model/login/login.dart';
import 'package:flutter_vss/product/service/model/login/login_response.dart';

abstract class AuthenticationOperation {
   Future<IResponseModel<LoginResponse?>?>  login(Login login);
}
