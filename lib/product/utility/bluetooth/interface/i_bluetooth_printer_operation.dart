import 'dart:async';

import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter_vss/product/utility/bluetooth/bluetooth_printer_operation.dart';
import 'package:flutter_vss/product/utility/bluetooth/interface/base/bluetooth_printer_base_mixin.dart';
import 'package:flutter_vss/product/utility/bluetooth/state/bluetooth_connection_state.dart';

abstract class IBluetoothPrinterOperation
    with BluetoothPrinterBaseMixin, BluetoothPrintMixin {
  StreamSubscription<BluetoothConnectionState> listenConnection(
    void Function(BluetoothConnectionState result)? onData,
  );

  Future<void> stopListen();

  Future<bool> isConnected();
  Future<bool> connect(BluetoothDevice? bluetoothDevice);
  Future<void> disconnect();
}
