import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
final class BluetoothBottomSheetState extends Equatable {
  const BluetoothBottomSheetState({
    required this.isLoading,
    this.devices,
  });
  final bool isLoading;
  final List<BluetoothDevice>? devices;

  @override
  List<Object?> get props => [isLoading, devices];

  BluetoothBottomSheetState copyWith({
    bool? isLoading,
    List<BluetoothDevice>? devices,
  }) {
    return BluetoothBottomSheetState(
        devices: devices ?? this.devices,
        isLoading: isLoading ?? this.isLoading);
  }
}
