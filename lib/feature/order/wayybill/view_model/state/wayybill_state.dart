import 'package:equatable/equatable.dart';
import 'package:flutter_vss/product/service/model/wayybill/wayybill.dart';

final class WayybillState extends Equatable {
  const WayybillState({
    required this.isLoading,
    this.wayyBill,
  });
  final WayyBill? wayyBill;
  final bool isLoading;

  @override
  List<Object?> get props => [isLoading, wayyBill];

  WayybillState copyWith({
    bool? isLoading,
    WayyBill? wayyBill,
  }) {
    return WayybillState(
      isLoading: isLoading ?? this.isLoading,
      wayyBill: wayyBill ?? this.wayyBill,
    );
  }
}
