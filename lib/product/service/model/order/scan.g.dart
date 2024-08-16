// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Scan _$ScanFromJson(Map<String, dynamic> json) => Scan(
      id: (json['id'] as num?)?.toInt(),
      result: json['result'] as String?,
      scanId: json['scanId'] as String?,
      deleted: json['deleted'] as bool? ?? false,
    );

Map<String, dynamic> _$ScanToJson(Scan instance) => <String, dynamic>{
      'id': instance.id,
      'scanId': instance.scanId,
      'result': instance.result,
      'deleted': instance.deleted,
    };
