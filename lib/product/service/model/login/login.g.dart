// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login _$LoginFromJson(Map<String, dynamic> json) => Login(
      username: json['username'] as String?,
      password: json['password'] as String?,
      macaddress: json['macaddress'] as String?,
      companyNo: json['companyNo'] as String?,
      periodNo: json['periodNo'] as String?,
    );

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'macaddress': instance.macaddress,
      'companyNo': instance.companyNo,
      'periodNo': instance.periodNo,
    };
