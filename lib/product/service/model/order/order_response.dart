import 'package:dio_nexus/dio_nexus.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'order.dart';
part 'order_response.g.dart';

@JsonSerializable()
class OrderResponse extends IDioNexusNetworkModel<OrderResponse>
    with EquatableMixin {
  OrderResponse({
    this.errorCode,
    this.result,
    this.orders,
    this.date,
  });

  int? errorCode;
  String? result;
  DateTime? date;
  List<Order>? orders;

  @override
  OrderResponse fromJson(Map<String, dynamic> json) =>
      OrderResponse.fromJson(json);

  factory OrderResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$OrderResponseToJson(this);

  @override
  List<Object?> get props => [errorCode, result, orders, date];

  OrderResponse copyWith({
    int? errorCode,
    String? result,
    DateTime? date,
    List<Order>? orders,
  }) {
    return OrderResponse(
      errorCode: errorCode ?? this.errorCode,
      result: result ?? this.result,
      orders: orders ?? this.orders,
      date: date ?? this.date,
    );
  }
}
