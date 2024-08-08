// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barcode_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BarcodeResponse _$BarcodeResponseFromJson(Map<String, dynamic> json) =>
    BarcodeResponse(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Barcode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BarcodeResponseToJson(BarcodeResponse instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
