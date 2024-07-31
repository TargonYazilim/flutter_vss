import 'package:dio_nexus/dio_nexus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_vss/product/widget/product_listview.dart/base_listview_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'order.g.dart';

@JsonSerializable()
class Order extends IDioNexusNetworkModel<Order>
    with EquatableMixin, BaseListviewModel<Order> {
  int? siparisLogicalRef;
  String? siparisNumarasi;
  String? siparisTarihi;
  String? sevkiyatYeri;
  String? sevkiyatAdresi;
  int? cariLogicalRef;
  String? cariKodu;
  String? cariUnvan;
//public string teslimatTarihi { get; set; }
  Order({
    this.siparisLogicalRef,
    this.siparisNumarasi,
    this.siparisTarihi,
    this.sevkiyatYeri,
    this.sevkiyatAdresi,
    this.cariLogicalRef,
    this.cariKodu,
    this.cariUnvan,
  });

  @override
  Order fromJson(Map<String, dynamic> json) => Order.fromJson(json);

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$OrderToJson(this);

  @override
  List<Object?> get props => [
        siparisLogicalRef,
        siparisNumarasi,
        siparisTarihi,
        sevkiyatYeri,
        sevkiyatAdresi,
        cariLogicalRef,
        cariKodu,
        cariUnvan
      ];

  Order copyWith({
    int? siparisLogicalRef,
    String? siparisNumarasi,
    String? siparisTarihi,
    String? sevkiyatYeri,
    String? sevkiyatAdresi,
    int? cariLogicalRef,
    String? cariKodu,
    String? cariUnvan,
  }) {
    return Order(
      siparisLogicalRef: siparisLogicalRef ?? this.siparisLogicalRef,
      siparisNumarasi: siparisNumarasi ?? this.siparisNumarasi,
      siparisTarihi: siparisTarihi ?? this.siparisTarihi,
      sevkiyatYeri: sevkiyatYeri ?? this.sevkiyatYeri,
      sevkiyatAdresi: sevkiyatAdresi ?? this.sevkiyatAdresi,
      cariLogicalRef: cariLogicalRef ?? this.cariLogicalRef,
      cariKodu: cariKodu ?? this.cariKodu,
      cariUnvan: cariUnvan ?? this.cariUnvan,
    );
  }

  @override
  String get title => '$cariUnvan - $siparisNumarasi - $sevkiyatYeri';
}
