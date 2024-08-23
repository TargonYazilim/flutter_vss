import 'package:equatable/equatable.dart';
import 'package:flutter_vss/product/service/model/wayybill/wayybill.dart';

final class WayybillState extends Equatable {
  const WayybillState({
    required this.isLoading,
    this.wayyBill,
    this.addressInfo,
  });
  final WayyBill? wayyBill;
  final bool isLoading;
  final String? addressInfo;

  @override
  List<Object?> get props => [isLoading, wayyBill, addressInfo];

  WayybillState copyWith({
    bool? isLoading,
    WayyBill? wayyBill,
    String? addressInfo,
  }) {
    return WayybillState(
      isLoading: isLoading ?? this.isLoading,
      wayyBill: wayyBill ?? this.wayyBill,
      addressInfo: addressInfo ?? this.addressInfo,
    );
  }
}
