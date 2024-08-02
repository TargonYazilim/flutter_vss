// ignore_for_file: public_member_api_docs

import 'package:dio_nexus/dio_nexus.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'barcode.g.dart';

@JsonSerializable()
class Barcode extends IDioNexusNetworkModel<Barcode> with EquatableMixin {
  Barcode({
    this.malzemeKodu,
    this.malzemeAdi,
    this.birim,
    this.kilo,
  });

  factory Barcode.fromJson(Map<String, dynamic> json) =>
      _$BarcodeFromJson(json);
  String? malzemeKodu;
  String? malzemeAdi;
  String? birim;
  String? kilo;

  @override
  Barcode fromJson(Map<String, dynamic> json) => Barcode.fromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BarcodeToJson(this);

  @override
  List<Object?> get props => [malzemeKodu, malzemeAdi, birim, kilo];

  Barcode copyWith({
    String? malzemeKodu,
    String? malzemeAdi,
    String? birim,
    String? kilo,
  }) {
    return Barcode(
      malzemeKodu: malzemeKodu ?? this.malzemeKodu,
      malzemeAdi: malzemeAdi ?? this.malzemeAdi,
      birim: birim ?? this.birim,
      kilo: kilo ?? this.kilo,
    );
  }
}
