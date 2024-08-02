// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barcode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Barcode _$BarcodeFromJson(Map<String, dynamic> json) => Barcode(
      malzemeKodu: json['malzemeKodu'] as String?,
      malzemeAdi: json['malzemeAdi'] as String?,
      birim: json['birim'] as String?,
      kilo: json['kilo'] as String?,
    );

Map<String, dynamic> _$BarcodeToJson(Barcode instance) => <String, dynamic>{
      'malzemeKodu': instance.malzemeKodu,
      'malzemeAdi': instance.malzemeAdi,
      'birim': instance.birim,
      'kilo': instance.kilo,
    };
