import 'package:flutter/material.dart';
import 'package:flutter_vss/product/cache/hive/hive_cache_operation.dart';
import 'package:flutter_vss/product/service/manager/product_service_manager.dart';
import 'package:flutter_vss/product/service/model/barcode/barcode.dart';
import 'package:flutter_vss/product/service/model/order/order.dart';
import 'package:flutter_vss/product/state/container/product_state_items.dart';

abstract class SplashBaseState<T extends StatefulWidget> extends State<T> {
  ProductNetworkManager get productNetworkManager =>
      ProductStateItems.productNetworkManager;

  HiveCacheOperation<Barcode> barcodeCacheOperation =
      ProductStateItems.productCache.barcodeCacheModel;

      
  HiveCacheOperation<Order> orderCacheOperation =
      ProductStateItems.productCache.orderCacheModel;
}
