import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vss/product/state/base/base_cubit.dart';
import 'package:flutter_vss/product/state/container/product_state_items.dart';
import 'package:flutter_vss/product/utility/bluetooth/interface/i_bluetooth_printer_manager.dart';
import 'package:flutter_vss/product/utility/constants/project_strings.dart';
import 'package:flutter_vss/product/utility/permission_handler/interface/product_permission_operation.dart';
import 'package:flutter_vss/product/widget/bottom_sheet/bluetooth_bottom_sheet/view_model/state/bluetooth_bottom_sheet_state.dart';

final class BluetoothBottomSheetViewModel
    extends BaseCubit<BluetoothBottomSheetState> {
  BluetoothBottomSheetViewModel({
    required IBluetoothPrinterManager bluetoothPrinterManager,
    required ProductPermissionOperation productPermissionOperation,
  })  : _bluetoothPrinterManager = bluetoothPrinterManager,
        _productPermissionOperation = productPermissionOperation,
        super(const BluetoothBottomSheetState(isLoading: false));

  late final IBluetoothPrinterManager _bluetoothPrinterManager;
  late final ProductPermissionOperation _productPermissionOperation;

  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  List<BluetoothDevice>? devices = [];

  /// Get bonded bluetooth devices
  Future<void> getDevices() async {
    try {
      changeLoading();

      final bluetoothConnectPermissionResult =
          await _productPermissionOperation.checkBluetoothConnectPermission();
      final bluetoothScanPermissionResult =
          await _productPermissionOperation.checkBluetoothScanPermission();
      final locationPermissionResult =
          await _productPermissionOperation.checkLocationPermission();

      if (bluetoothConnectPermissionResult &&
          locationPermissionResult &&
          bluetoothScanPermissionResult) {
        devices = await _bluetoothPrinterManager.getBluetoothDevices();

        emit(state.copyWith(devices: devices));
      } else {
        ProductStateItems.toastService
            .showErrorMessage(message: ProjectStrings.permissionError);
      }
    } finally {
      changeLoading();
    }
  }

  void changeLoading() => emit(state.copyWith(isLoading: !state.isLoading));
}
