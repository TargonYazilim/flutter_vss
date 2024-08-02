import 'package:dio_nexus/dio_nexus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_vss/product/widget/product_listview.dart/base_listview_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_detail.g.dart';

@JsonSerializable()
class OrderDetail extends IDioNexusNetworkModel<OrderDetail>
    with EquatableMixin, BaseListviewModel<OrderDetail> {
  OrderDetail({
    this.malzemeKodu,
    this.malzemeAdi,
    this.birim,
    this.miktar,
    this.scanResult,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailFromJson(json);
  String? malzemeKodu;
  String? malzemeAdi;
  String? birim;
  int? miktar;
  String? scanResult;

  @override
  OrderDetail fromJson(Map<String, dynamic> json) => OrderDetail.fromJson(json);

  @override
  Map<String, dynamic> toJson() => _$OrderDetailToJson(this);

  @override
  List<Object?> get props =>
      [malzemeKodu, malzemeAdi, birim, miktar, scanResult];

  OrderDetail copyWith({
    String? malzemeKodu,
    String? malzemeAdi,
    String? birim,
    int? miktar,
    String? scanResult,
  }) {
    return OrderDetail(
      malzemeKodu: malzemeKodu ?? this.malzemeKodu,
      malzemeAdi: malzemeAdi ?? this.malzemeAdi,
      birim: birim ?? this.birim,
      miktar: miktar ?? this.miktar,
      scanResult: scanResult ?? this.scanResult,
    );
  }

  @override
  String get title => '$malzemeAdi - $miktar $birim - ${scanResult ?? ''}';
}
