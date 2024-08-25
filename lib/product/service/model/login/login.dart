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
    this.companyNo,
    this.periodNo,
  });

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);
  String? username;
  String? password;
  String? macaddress;
  String? companyNo;
  String? periodNo;

  @override
  Login fromJson(Map<String, dynamic> json) => Login.fromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LoginToJson(this);

  @override
  List<Object?> get props =>
      [username, password, macaddress, companyNo, periodNo];

  Login copyWith({
    String? username,
    String? password,
    String? macaddress,
    String? companyNo,
    String? periodNo,
  }) {
    return Login(
      username: username ?? this.username,
      password: password ?? this.password,
      macaddress: macaddress ?? this.macaddress,
      companyNo: companyNo ?? this.companyNo,
      periodNo: periodNo ?? this.periodNo,
    );
  }
}
