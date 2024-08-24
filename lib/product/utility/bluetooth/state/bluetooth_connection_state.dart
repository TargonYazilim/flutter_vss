import 'package:flutter_vss/product/utility/constants/project_strings.dart';

enum BluetoothConnectionState {
  CONNECTED(ProjectStrings.bluetoothConnected),
  DISCONNECTED(ProjectStrings.bluetoothHasNoConnect);

  final String value;
  const BluetoothConnectionState(this.value);

  static BluetoothConnectionState getState(int state) {
    switch (state) {
      case 0:
        return BluetoothConnectionState.CONNECTED;
      case 1:
        return BluetoothConnectionState.DISCONNECTED;
      default:
        return BluetoothConnectionState.DISCONNECTED;
    }
  }
}
