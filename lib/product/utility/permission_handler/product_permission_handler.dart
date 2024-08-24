import 'package:flutter_vss/product/utility/permission_handler/interface/product_permission_operation.dart';
import 'package:permission_handler/permission_handler.dart';

final class ProductPermissionHandler extends ProductPermissionOperation {
  @override
  Future<bool> checkBluetoothScanPermission() async {
    final status = await Permission.bluetoothScan.status;
    if (status.isDenied) {
      final result = await Permission.bluetoothScan.request();
      return result.isGranted;
    }
    return status.isGranted;
  }

  @override
  Future<bool> checkBluetoothConnectPermission() async {
    final status = await Permission.bluetoothConnect.status;
    if (status.isDenied) {
      final result = await Permission.bluetoothConnect.request();
      return result.isGranted;
    }
    return status.isGranted;
  }

  @override
  Future<bool> checkLocationPermission() async {
    final status = await Permission.location.status;
    if (status.isDenied) {
      final result = await Permission.location.request();
      return result.isGranted;
    }
    return status.isGranted;
  }
}
