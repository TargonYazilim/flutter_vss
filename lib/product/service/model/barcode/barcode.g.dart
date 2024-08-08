// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barcode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Barcode _$BarcodeFromJson(Map<String, dynamic> json) => Barcode(
      malzemeKodu: json['malzemeKodu'] as String?,
      barkod: json['barkod'] as String?,
      kilo: json['kilo'] as String?,
      birim: json['birim'] as String?,
    );

Map<String, dynamic> _$BarcodeToJson(Barcode instance) => <String, dynamic>{
      'malzemeKodu': instance.malzemeKodu,
      'barkod': instance.barkod,
      'kilo': instance.kilo,
      'birim': instance.birim,
    };
