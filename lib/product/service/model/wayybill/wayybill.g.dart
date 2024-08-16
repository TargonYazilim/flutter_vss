// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wayybill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WayyBill _$WayyBillFromJson(Map<String, dynamic> json) => WayyBill(
      errorCode: (json['errorCode'] as num?)?.toInt(),
      result: json['result'] as String?,
      baslik: json['baslik'] == null
          ? null
          : IrsaliyeDetail.fromJson(json['baslik'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WayyBillToJson(WayyBill instance) => <String, dynamic>{
      'errorCode': instance.errorCode,
      'result': instance.result,
      'baslik': instance.baslik,
    };
