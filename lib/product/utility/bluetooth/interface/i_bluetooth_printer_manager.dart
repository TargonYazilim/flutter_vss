import 'dart:async';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter_vss/product/utility/bluetooth/interface/base/bluetooth_printer_base_mixin.dart';

abstract class IBluetoothPrinterManager with BluetoothPrinterBaseMixin {
  Future<List<BluetoothDevice>?> getBluetoothDevices();
}
