import 'dart:async';

import 'package:blue_thermal_printer/blue_thermal_printer.dart';

abstract class IBluetoothPrinterManager {
  Future<List<BluetoothDevice>?> getBluetoothDevices();
}
