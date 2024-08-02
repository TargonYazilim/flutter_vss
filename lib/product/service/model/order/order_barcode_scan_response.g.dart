// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_barcode_scan_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderBarcodeScanResponse _$OrderBarcodeScanResponseFromJson(
        Map<String, dynamic> json) =>
    OrderBarcodeScanResponse(
      errorCode: (json['errorCode'] as num?)?.toInt(),
      result: json['result'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Barcode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderBarcodeScanResponseToJson(
        OrderBarcodeScanResponse instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'result': instance.result,
      'items': instance.items,
    };
