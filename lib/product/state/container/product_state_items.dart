import 'package:flutter_vss/product/cache/product_cache.dart';
import 'package:flutter_vss/product/cache/shared/shared_cache_operation.dart';
import 'package:flutter_vss/product/service/manager/order/synchronize_cache_operation.dart';
import 'package:flutter_vss/product/service/manager/product_service_manager.dart';
import 'package:flutter_vss/product/state/container/product_state_container.dart';
import 'package:flutter_vss/product/state/view_model/product_view_model.dart';
import 'package:flutter_vss/product/utility/bluetooth/interface/i_bluetooth_printer_manager.dart';
import 'package:flutter_vss/product/utility/bluetooth/interface/i_bluetooth_printer_operation.dart';
import 'package:flutter_vss/product/utility/permission_handler/interface/product_permission_operation.dart';
import 'package:flutter_vss/product/utility/toast/toast_service.dart';

class ProductStateItems {
  const ProductStateItems._();

  static ProductNetworkManager get productNetworkManager =>
      ProductContainer.read<ProductNetworkManager>();

  static ProductViewModel get productViewModel =>
      ProductContainer.read<ProductViewModel>();

  static ToastService get toastService => ProductContainer.read<ToastService>();

  static ProductCache get productCache => ProductContainer.read<ProductCache>();

  static SharedCacheOperation get productSharedCache =>
      ProductContainer.read<SharedCacheOperation>();

  static ISynchronizeCacheOperation get synchronizeCache =>
      ProductContainer.read<ISynchronizeCacheOperation>();

  static IBluetoothPrinterManager get bluetoothManager =>
      ProductContainer.read<IBluetoothPrinterManager>();

  static IBluetoothPrinterOperation get bluetoothOperation =>
      ProductContainer.read<IBluetoothPrinterOperation>();

  static ProductPermissionOperation get permissionHandler =>
      ProductContainer.read<ProductPermissionOperation>();
}
