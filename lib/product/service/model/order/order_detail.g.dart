// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetail _$OrderDetailFromJson(Map<String, dynamic> json) => OrderDetail(
      malzemeKodu: json['malzemeKodu'] as String?,
      malzemeAdi: json['malzemeAdi'] as String?,
      birim: json['birim'] as String?,
      miktar: (json['miktar'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OrderDetailToJson(OrderDetail instance) =>
    <String, dynamic>{
      'malzemeKodu': instance.malzemeKodu,
      'malzemeAdi': instance.malzemeAdi,
      'birim': instance.birim,
      'miktar': instance.miktar,
    };
