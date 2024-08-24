import 'dart:async';

import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter_vss/product/utility/bluetooth/state/bluetooth_connection_state.dart';

abstract class IBluetoothPrinterOperation {
  StreamSubscription<BluetoothConnectionState> listenConnection(
    void Function(BluetoothConnectionState result)? onData,
  );

  Future<void> stopListen();

  Future<bool> isConnected();
  Future<bool> connect(BluetoothDevice? bluetoothDevice);
  Future<void> disconnect();
}
