import 'package:dio_nexus/dio_nexus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_vss/product/cache/core/cache_model.dart';
import 'package:flutter_vss/product/service/model/order/scan.dart';
import 'package:flutter_vss/product/widget/product_listview.dart/base_listview_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_detail.g.dart';

@JsonSerializable()
class OrderDetail extends IDioNexusNetworkModel<OrderDetail>
    with
        EquatableMixin,
        BaseListviewModel<OrderDetail, Scan>,
        CacheModel<OrderDetail> {
  OrderDetail({
    this.id,
    this.malzemeKodu,
    this.malzemeAdi,
    this.birim,
    this.miktar,
    this.scans,
    this.siparisId,
  });

  OrderDetail.empty();

  factory OrderDetail.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailFromJson(json);
  int? id;
  String? malzemeKodu;
  String? malzemeAdi;
  String? birim;
  int? miktar;
  List<Scan>? scans;
  int? siparisId;

  @override
  OrderDetail fromJson(Map<String, dynamic> json) => OrderDetail.fromJson(json);

  @override
  Map<String, dynamic> toJson() => _$OrderDetailToJson(this);

  @override
  List<Object?> get props => [malzemeKodu, malzemeAdi, birim, miktar, scans];

  OrderDetail copyWith({
    int? id,
    String? malzemeKodu,
    String? malzemeAdi,
    String? birim,
    int? miktar,
    List<Scan>? scans,
    int? siparisId,
  }) {
    return OrderDetail(
      id: id ?? this.id,
      malzemeKodu: malzemeKodu ?? this.malzemeKodu,
      malzemeAdi: malzemeAdi ?? this.malzemeAdi,
      birim: birim ?? this.birim,
      miktar: miktar ?? this.miktar,
      scans: scans ?? this.scans,
      siparisId: siparisId ?? this.siparisId,
    );
  }

  @override
  String get title => '$malzemeAdi';

  @override
  String? get subTitle => '$miktar $birim';

  @override
  String get cacheId => siparisId.toString();

  @override
  List<Scan> get subList => scans ?? [];
}
