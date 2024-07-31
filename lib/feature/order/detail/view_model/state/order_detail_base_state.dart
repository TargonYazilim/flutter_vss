import 'package:flutter/material.dart';
import 'package:flutter_vss/product/service/manager/product_service_manager.dart';
import 'package:flutter_vss/product/state/container/product_state_items.dart';

abstract class OrderDetailBaseState<T extends StatefulWidget> extends State<T> {
  ProductNetworkManager get productNetworkManager =>
      ProductStateItems.productNetworkManager;
}
