// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      siparisLogicalRef: (json['siparisLogicalRef'] as num?)?.toInt(),
      siparisNumarasi: json['siparisNumarasi'] as String?,
      siparisTarihi: json['siparisTarihi'] as String?,
      sevkiyatYeri: json['sevkiyatYeri'] as String?,
      sevkiyatAdresi: json['sevkiyatAdresi'] as String?,
      cariLogicalRef: (json['cariLogicalRef'] as num?)?.toInt(),
      cariKodu: json['cariKodu'] as String?,
      cariUnvan: json['cariUnvan'] as String?,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'siparisLogicalRef': instance.siparisLogicalRef,
      'siparisNumarasi': instance.siparisNumarasi,
      'siparisTarihi': instance.siparisTarihi,
      'sevkiyatYeri': instance.sevkiyatYeri,
      'sevkiyatAdresi': instance.sevkiyatAdresi,
      'cariLogicalRef': instance.cariLogicalRef,
      'cariKodu': instance.cariKodu,
      'cariUnvan': instance.cariUnvan,
    };
