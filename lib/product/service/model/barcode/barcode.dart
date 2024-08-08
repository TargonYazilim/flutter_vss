import 'package:dio_nexus/dio_nexus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_vss/product/cache/core/cache_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'barcode.g.dart';

@JsonSerializable()
class Barcode extends IDioNexusNetworkModel<Barcode>
    with EquatableMixin, CacheModel<Barcode> {
  String? malzemeKodu;
  String? barkod;
  String? kilo;
  String? birim;

  Barcode({
    this.malzemeKodu,
    this.barkod,
    this.kilo,
    this.birim,
  });

  Barcode.empty();

  @override
  Barcode fromJson(Map<String, dynamic> json) => Barcode.fromJson(json);

  factory Barcode.fromJson(Map<String, dynamic> json) =>
      _$BarcodeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BarcodeToJson(this);

  @override
  List<Object?> get props => [malzemeKodu, barkod, kilo, birim];

  Barcode copyWith({
    String? malzemeKodu,
    String? barkod,
    String? kilo,
    String? birim,
  }) {
    return Barcode(
      malzemeKodu: malzemeKodu ?? this.malzemeKodu,
      barkod: barkod ?? this.barkod,
      kilo: kilo ?? this.kilo,
      birim: birim ?? this.birim,
    );
  }

  @override
  String get cacheId => barkod.toString();
}
