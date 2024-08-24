import 'package:flutter/material.dart';
import 'package:flutter_vss/product/state/container/product_state_items.dart';
import 'package:flutter_vss/product/utility/bluetooth/interface/i_bluetooth_printer_manager.dart';

abstract class BluetoothBottomSheetBaseState<T extends StatefulWidget>
    extends State<T> {
  IBluetoothPrinterManager get bluetoothManager =>
      ProductStateItems.bluetoothManager;
}
