import 'package:flutter/material.dart';
import 'package:flutter_vss/product/cache/product_cache.dart';
import 'package:flutter_vss/product/cache/shared/shared_cache_operation.dart';
import 'package:flutter_vss/product/service/manager/product_service_manager.dart';
import 'package:flutter_vss/product/state/container/product_state_items.dart';
import 'package:flutter_vss/product/utility/bluetooth/interface/i_bluetooth_printer_operation.dart';

abstract class WayybillBaseState<T extends StatefulWidget> extends State<T> {
  ProductNetworkManager get productNetworkManager =>
      ProductStateItems.productNetworkManager;

  IBluetoothPrinterOperation get bluetoothOperation =>
      ProductStateItems.bluetoothOperation;

  ProductCache get productCache => ProductStateItems.productCache;

  SharedCacheOperation get productSharedCache =>
      ProductStateItems.productSharedCache;
}
