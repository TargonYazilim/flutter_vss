import 'package:dio_nexus/dio_nexus.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends IDioNexusNetworkModel<LoginResponse>
    with EquatableMixin {
  int? id;
  String? error;
  String? result;
  String? token;

  LoginResponse({
    this.id,
    this.error,
    this.result,
    this.token,
  });

  @override
  LoginResponse fromJson(Map<String, dynamic> json) =>
      LoginResponse.fromJson(json);

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  @override
  List<Object?> get props => [error, result, token, id];

  LoginResponse copyWith({
    int? id,
    String? error,
    String? result,
    String? token,
  }) {
    return LoginResponse(
      id: id ?? this.id,
      error: error ?? this.error,
      result: result ?? this.result,
      token: token ?? this.token,
    );
  }
}
