import 'package:dio_nexus/dio_nexus.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login.g.dart';

@JsonSerializable()
class Login extends IDioNexusNetworkModel<Login> with EquatableMixin {
  Login({
    this.username,
    this.password,
    this.macaddress,
  });

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);
  String? username;
  String? password;
  String? macaddress;

  @override
  Login fromJson(Map<String, dynamic> json) => Login.fromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LoginToJson(this);

  @override
  List<Object?> get props => [username, password, macaddress];

  Login copyWith({
    String? username,
    String? password,
    String? macaddress,
  }) {
    return Login(
      username: username ?? this.username,
      password: password ?? this.password,
      macaddress: macaddress ?? this.macaddress,
    );
  }
}
