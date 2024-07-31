import 'package:equatable/equatable.dart';
import 'package:flutter_vss/product/service/model/order/order_detail_response.dart';

final class OrderDetailState extends Equatable {
  const OrderDetailState({required this.isLoading, this.orderDetailResponse});
  final OrderDetailResponse? orderDetailResponse;
  final bool isLoading;

  @override
  List<Object?> get props => [orderDetailResponse, isLoading];

  OrderDetailState copyWith(
      {bool? isLoading, OrderDetailResponse? orderDetailResponse}) {
    return OrderDetailState(
      orderDetailResponse: orderDetailResponse ?? this.orderDetailResponse,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
