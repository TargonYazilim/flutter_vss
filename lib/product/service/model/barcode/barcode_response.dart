import 'package:dio_nexus/dio_nexus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_vss/product/service/model/barcode/barcode.dart';
import 'package:json_annotation/json_annotation.dart';

part 'barcode_response.g.dart';

@JsonSerializable()
class BarcodeResponse extends IDioNexusNetworkModel<BarcodeResponse>
    with EquatableMixin {
  BarcodeResponse({
    this.items,
  });

  factory BarcodeResponse.fromJson(Map<String, dynamic> json) =>
      _$BarcodeResponseFromJson(json);
  List<Barcode>? items;

  @override
  BarcodeResponse fromJson(Map<String, dynamic> json) =>
      BarcodeResponse.fromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BarcodeResponseToJson(this);

  @override
  List<Object?> get props => [items];

  BarcodeResponse copyWith({
    List<Barcode>? items,
  }) {
    return BarcodeResponse(
      items: items ?? this.items,
    );
  }
}
