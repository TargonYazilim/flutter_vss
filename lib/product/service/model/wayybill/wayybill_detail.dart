import 'package:dio_nexus/dio_nexus.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wayybill_detail.g.dart';

@JsonSerializable()
class IrsaliyeDetail extends IDioNexusNetworkModel<IrsaliyeDetail> {
  String? cariKodu;
  String? cariUnvan;
  String? cariAdresi;
  String? cariVergiDairesi;
  String? cariVKN;
  String? siparisNumarasi;
  String? siparisTarihi;

  IrsaliyeDetail({
    this.cariKodu,
    this.cariUnvan,
    this.cariAdresi,
    this.cariVergiDairesi,
    this.cariVKN,
    this.siparisNumarasi,
    this.siparisTarihi,
  });

  @override
  IrsaliyeDetail fromJson(Map<String, dynamic> json) =>
      IrsaliyeDetail.fromJson(json);

  factory IrsaliyeDetail.fromJson(Map<String, dynamic> json) =>
      _$IrsaliyeDetailFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$IrsaliyeDetailToJson(this);

  IrsaliyeDetail copyWith({
    String? cariKodu,
    String? cariUnvan,
    String? cariAdresi,
    String? cariVergiDairesi,
    String? cariVKN,
    String? siparisNumarasi,
    String? siparisTarihi,
  }) {
    return IrsaliyeDetail(
      cariKodu: cariKodu ?? this.cariKodu,
      cariUnvan: cariUnvan ?? this.cariUnvan,
      cariAdresi: cariAdresi ?? this.cariAdresi,
      cariVergiDairesi: cariVergiDairesi ?? this.cariVergiDairesi,
      cariVKN: cariVKN ?? this.cariVKN,
      siparisNumarasi: siparisNumarasi ?? this.siparisNumarasi,
      siparisTarihi: siparisTarihi ?? this.siparisTarihi,
    );
  }
}
