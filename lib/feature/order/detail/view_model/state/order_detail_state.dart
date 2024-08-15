import 'package:equatable/equatable.dart';
import 'package:flutter_vss/product/service/model/order/order_detail.dart';

final class OrderDetailState extends Equatable {
  const OrderDetailState({required this.isLoading, this.orderDetails});
  final List<OrderDetail>? orderDetails;
  final bool isLoading;

  @override
  List<Object?> get props => [orderDetails, isLoading];

  OrderDetailState copyWith({
    bool? isLoading,
    List<OrderDetail>? orderDetails,
  }) {
    return OrderDetailState(
      orderDetails: orderDetails ?? this.orderDetails,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
