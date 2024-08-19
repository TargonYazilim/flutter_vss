import 'package:dio_nexus/dio_nexus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_vss/product/cache/core/cache_model.dart';
import 'package:flutter_vss/product/service/model/order/order_detail.dart';
import 'package:flutter_vss/product/service/model/order/scan.dart';
import 'package:flutter_vss/product/widget/product_listview.dart/base_listview_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable()
class Order extends IDioNexusNetworkModel<Order>
    with EquatableMixin, BaseListviewModel<Order, Scan>, CacheModel<Order> {
  Order({
    this.id,
    this.siparisLogicalRef,
    this.siparisNumarasi,
    this.siparisTarihi,
    this.sevkiyatYeri,
    this.sevkiyatAdresi,
    this.cariLogicalRef,
    this.cariKodu,
    this.cariUnvan,
    this.orderDetails,
    this.synchronized = false,
  });
  Order.empty();

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  int? id;
  int? siparisLogicalRef;
  String? siparisNumarasi;
  String? siparisTarihi;
  String? sevkiyatYeri;
  String? sevkiyatAdresi;
  int? cariLogicalRef;
  String? cariKodu;
  String? cariUnvan;
  bool? synchronized;
  List<OrderDetail>? orderDetails;

  @override
  Order fromJson(Map<String, dynamic> json) => Order.fromJson(json);

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
        cariUnvan,
        orderDetails,
        synchronized,
      ];

  Order copyWith({
    int? id,
    int? siparisLogicalRef,
    String? siparisNumarasi,
    String? siparisTarihi,
    String? sevkiyatYeri,
    String? sevkiyatAdresi,
    int? cariLogicalRef,
    String? cariKodu,
    String? cariUnvan,
    bool? synchronized,
    List<OrderDetail>? orderDetails,
  }) {
    return Order(
      id: id ?? this.id,
      siparisLogicalRef: siparisLogicalRef ?? this.siparisLogicalRef,
      siparisNumarasi: siparisNumarasi ?? this.siparisNumarasi,
      siparisTarihi: siparisTarihi ?? this.siparisTarihi,
      sevkiyatYeri: sevkiyatYeri ?? this.sevkiyatYeri,
      sevkiyatAdresi: sevkiyatAdresi ?? this.sevkiyatAdresi,
      cariLogicalRef: cariLogicalRef ?? this.cariLogicalRef,
      cariKodu: cariKodu ?? this.cariKodu,
      cariUnvan: cariUnvan ?? this.cariUnvan,
      synchronized: synchronized ?? this.synchronized,
      orderDetails: orderDetails ?? this.orderDetails,
    );
  }

  @override
  String get title => '$cariUnvan - $siparisNumarasi - $sevkiyatYeri';

  @override
  String get cacheId => siparisLogicalRef.toString();

  @override
  List<Scan> get subList => [];
  
  @override
  String? get subTitle => null;
}
