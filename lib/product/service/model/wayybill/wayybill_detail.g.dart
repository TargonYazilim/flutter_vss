// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wayybill_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IrsaliyeDetail _$IrsaliyeDetailFromJson(Map<String, dynamic> json) =>
    IrsaliyeDetail(
      cariKodu: json['cariKodu'] as String?,
      cariUnvan: json['cariUnvan'] as String?,
      cariAdresi: json['cariAdresi'] as String?,
      cariVergiDairesi: json['cariVergiDairesi'] as String?,
      cariVKN: json['cariVKN'] as String?,
      siparisNumarasi: json['siparisNumarasi'] as String?,
      siparisTarihi: json['siparisTarihi'] as String?,
    );

Map<String, dynamic> _$IrsaliyeDetailToJson(IrsaliyeDetail instance) =>
    <String, dynamic>{
      'cariKodu': instance.cariKodu,
      'cariUnvan': instance.cariUnvan,
      'cariAdresi': instance.cariAdresi,
      'cariVergiDairesi': instance.cariVergiDairesi,
      'cariVKN': instance.cariVKN,
      'siparisNumarasi': instance.siparisNumarasi,
      'siparisTarihi': instance.siparisTarihi,
    };
