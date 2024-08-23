import 'package:dio_nexus/dio_nexus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_vss/product/cache/core/cache_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends IDioNexusNetworkModel<LoginResponse>
    with EquatableMixin, CacheModel<LoginResponse> {
  LoginResponse({
    this.id,
    this.error,
    this.result,
    this.token,
    this.addressInfo,
  });

  LoginResponse.empty();

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  int? id;
  String? error;
  String? result;
  String? token;
  String? addressInfo;

  @override
  LoginResponse fromJson(Map<String, dynamic> json) =>
      LoginResponse.fromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  @override
  List<Object?> get props => [error, result, token, addressInfo, id];

  LoginResponse copyWith({
    int? id,
    String? error,
    String? result,
    String? token,
    String? addressInfo,
  }) {
    return LoginResponse(
      id: id ?? this.id,
      error: error ?? this.error,
      result: result ?? this.result,
      token: token ?? this.token,
      addressInfo: addressInfo ?? this.addressInfo,
    );
  }

  @override
  String get cacheId => id.toString();
}
