import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vss/product/service/model/order/order.dart';

@immutable
final class OrderState extends Equatable {
  const OrderState({required this.isLoading, this.orders});
  final List<Order>? orders;
  final bool isLoading;

  @override
  List<Object?> get props => [orders, isLoading];

  OrderState copyWith({bool? isLoading, List<Order>? orders}) {
    return OrderState(
      orders: orders ?? this.orders,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
