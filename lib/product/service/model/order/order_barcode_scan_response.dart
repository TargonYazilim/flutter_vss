// ignore_for_file: public_member_api_docs

import 'package:dio_nexus/dio_nexus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_vss/product/service/model/order/barcode.dart';
import 'package:json_annotation/json_annotation.dart';
part 'order_barcode_scan_response.g.dart';

@JsonSerializable()
class OrderBarcodeScanResponse
    extends IDioNexusNetworkModel<OrderBarcodeScanResponse>
    with EquatableMixin {
  OrderBarcodeScanResponse({
    this.errorCode,
    this.result,
    this.items,
  });
  
  int? errorCode;
  String? result;
  List<Barcode>? items;

  @override
  OrderBarcodeScanResponse fromJson(Map<String, dynamic> json) =>
      OrderBarcodeScanResponse.fromJson(json);

  factory OrderBarcodeScanResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderBarcodeScanResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$OrderBarcodeScanResponseToJson(this);

  @override
  List<Object?> get props => [errorCode, result, items];

  OrderBarcodeScanResponse copyWith({
    int? errorCode,
    String? result,
    List<Barcode>? items,
  }) {
    return OrderBarcodeScanResponse(
      errorCode: errorCode ?? this.errorCode,
      result: result ?? this.result,
      items: items ?? this.items,
    );
  }
}
