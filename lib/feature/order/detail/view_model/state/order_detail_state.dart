import 'package:equatable/equatable.dart';
import 'package:flutter_vss/product/service/model/order/order_detail.dart';

final class OrderDetailState extends Equatable {
  const OrderDetailState(
      {required this.isLoading, this.orderDetails, required this.showButton});
  final List<OrderDetail>? orderDetails;
  final bool isLoading;
  final bool showButton;

  @override
  List<Object?> get props => [orderDetails, isLoading, showButton];

  OrderDetailState copyWith({
    bool? isLoading,
    bool? showButton,
    List<OrderDetail>? orderDetails,
  }) {
    return OrderDetailState(
      orderDetails: orderDetails ?? this.orderDetails,
      isLoading: isLoading ?? this.isLoading,
      showButton: showButton ?? this.showButton,
    );
  }
}
