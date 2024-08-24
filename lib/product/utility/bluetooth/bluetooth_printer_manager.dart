import 'dart:async';

import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vss/product/state/container/product_state_items.dart';
import 'package:flutter_vss/product/utility/bluetooth/interface/i_bluetooth_printer_manager.dart';
import 'package:flutter_vss/product/utility/constants/project_strings.dart';

final class BluetoothPrinterManager extends IBluetoothPrinterManager {
  final BlueThermalPrinter _bluetooth = BlueThermalPrinter.instance;

  @override
  Future<List<BluetoothDevice>?> getBluetoothDevices() async {
    try {
      final isBluetoothOn = (await _bluetooth.isOn) ?? false;
      if (!isBluetoothOn) {
        ProductStateItems.toastService
            .showErrorMessage(message: ProjectStrings.noBluetoothDevices);
        return null;
      }
  
      return await _bluetooth.getBondedDevices();
    } catch (e) {
      debugPrint('Bluetooth error $e');
    }
    return null;
  }
}
