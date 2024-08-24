abstract class ProductPermissionOperation {
  Future<bool> checkBluetoothScanPermission();
  Future<bool> checkBluetoothConnectPermission();
  Future<bool> checkLocationPermission();
}
