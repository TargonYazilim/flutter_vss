import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vss/product/service/model/order/order_response.dart';

@immutable
final class OrderState extends Equatable {
  const OrderState({required this.isLoading, this.orderResponse});
  final OrderResponse? orderResponse;
  final bool isLoading;

  @override
  List<Object?> get props => [orderResponse, isLoading];

  OrderState copyWith({bool? isLoading, OrderResponse? orderResponse}) {
    return OrderState(
      orderResponse: orderResponse ?? this.orderResponse,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
