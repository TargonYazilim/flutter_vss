// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetail _$OrderDetailFromJson(Map<String, dynamic> json) => OrderDetail(
      id: (json['id'] as num?)?.toInt(),
      malzemeKodu: json['malzemeKodu'] as String?,
      malzemeAdi: json['malzemeAdi'] as String?,
      birim: json['birim'] as String?,
      miktar: (json['miktar'] as num?)?.toInt(),
      scans: (json['scans'] as List<dynamic>?)
          ?.map((e) => Scan.fromJson(e as Map<String, dynamic>))
          .toList(),
      siparisId: (json['siparisId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OrderDetailToJson(OrderDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'malzemeKodu': instance.malzemeKodu,
      'malzemeAdi': instance.malzemeAdi,
      'birim': instance.birim,
      'miktar': instance.miktar,
      'scans': instance.scans,
      'siparisId': instance.siparisId,
    };
