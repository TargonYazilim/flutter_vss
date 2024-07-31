import 'package:dio_nexus/dio_nexus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_vss/product/service/model/order/order_detail.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_detail_response.g.dart';

@JsonSerializable()
class OrderDetailResponse extends IDioNexusNetworkModel<OrderDetailResponse>
    with EquatableMixin {
  int? errorCode;
  String? result;
  List<OrderDetail>? orderLines;

  OrderDetailResponse({
    this.errorCode,
    this.result,
    this.orderLines,
  });

  @override
  OrderDetailResponse fromJson(Map<String, dynamic> json) =>
      OrderDetailResponse.fromJson(json);

  factory OrderDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$OrderDetailResponseToJson(this);

  @override
  List<Object?> get props => [errorCode, result, orderLines];

  OrderDetailResponse copyWith({
    int? errorCode,
    String? result,
    List<OrderDetail>? orderLines,
  }) {
    return OrderDetailResponse(
      errorCode: errorCode ?? this.errorCode,
      result: result ?? this.result,
      orderLines: orderLines ?? this.orderLines,
    );
  }
}


