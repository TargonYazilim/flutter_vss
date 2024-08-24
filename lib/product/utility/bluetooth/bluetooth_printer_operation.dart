import 'dart:async';

import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vss/product/utility/bluetooth/interface/i_bluetooth_printer_operation.dart';
import 'package:flutter_vss/product/utility/bluetooth/state/bluetooth_connection_state.dart';

final class BluetoothPrinterOperation extends IBluetoothPrinterOperation {
  final BlueThermalPrinter _bluetooth = BlueThermalPrinter.instance;

  StreamSubscription<BluetoothConnectionState>? _subscription;

  @override
  StreamSubscription<BluetoothConnectionState> listenConnection(
    void Function(BluetoothConnectionState result)? onData,
  ) {
    _subscription = _bluetooth.onStateChanged().map((int? state) {
      return BluetoothConnectionState.getState(state ?? -1);
    }).listen((BluetoothConnectionState state) {
      onData?.call(state);
    });
    return _subscription!;
  }

  @override
  Future<void> stopListen() async {
    await _subscription?.cancel();
  }

  @override
  Future<bool> isConnected() async {
    return await _bluetooth.isConnected ?? false;
  }

  @override
  Future<void> disconnect() async {
    await _bluetooth.disconnect();
  }

  @override
  Future<bool> connect(BluetoothDevice? bluetoothDevice) async {
    if (bluetoothDevice == null) return false;

    /// If already bluetooth is connected
    /// first of all disconnected old connection
    if (await isConnected()) await disconnect();

    try {
      await _bluetooth.connect(bluetoothDevice);
    } catch (e) {
      debugPrint('Error :$e');
      return false;
    } finally {}
    return isConnected();
  }
}
