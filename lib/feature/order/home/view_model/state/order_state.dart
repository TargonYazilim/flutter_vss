import 'package:equatable/equatable.dart';
import 'package:flutter_vss/product/service/model/order/order_response.dart';

final class OrderState extends Equatable {
  final OrderResponse? orderResponse;
  final bool isLoading;

  OrderState({required this.isLoading, this.orderResponse});

  @override
  List<Object?> get props => [orderResponse, isLoading];

  OrderState copyWith({bool? isLoading, OrderResponse? orderResponse}) {
    return OrderState(
      orderResponse: orderResponse ?? this.orderResponse,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
