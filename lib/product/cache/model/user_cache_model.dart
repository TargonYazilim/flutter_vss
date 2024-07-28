import 'package:flutter_vss/product/cache/core/cache_model.dart';
import 'package:flutter_vss/product/service/model/login/login_response.dart';
import 'package:kartal/kartal.dart';

final class LoginResponseCacheModel with CacheModel {
 LoginResponseCacheModel({required this.loginResponse});
  LoginResponseCacheModel.empty() : loginResponse = LoginResponse();

  final LoginResponse loginResponse;


  @override
  LoginResponseCacheModel fromDynamicJson(dynamic json) {
    final jsonMap = json as Map<String, dynamic>?;
    if (jsonMap == null) {
      CustomLogger.showError<LoginResponse>('Json cannot be null');
      return this;
    }
    return copyWith(loginResponse: LoginResponse.fromJson(jsonMap));
  }

  @override
  String get id => loginResponse.id.toString();

  @override
  Map<String, dynamic> toJson() => loginResponse.toJson();

  LoginResponseCacheModel copyWith({LoginResponse? loginResponse}) {
    return LoginResponseCacheModel(
      loginResponse: loginResponse ?? this.loginResponse,
    );
  }
}
