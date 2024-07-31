// ignore_for_file: public_member_api_docs

import 'package:flutter_vss/feature/order/home/view/order_view.dart';
import 'package:flutter_vss/feature/order/home/view_model/order_view_model.dart';
import 'package:flutter_vss/feature/order/home/view_model/state/order_base_state.dart';
import 'package:flutter_vss/product/service/manager/product_network_error_manager.dart';
import 'package:flutter_vss/product/service/order_service.dart';
import 'package:flutter_vss/product/state/container/product_state_items.dart';

mixin OrderViewMixin on OrderBaseState<OrderView> {
  late final ProductNetworkErrorManager _productNetworkErrorManager;

  late OrderViewModel _orderViewModel;

  OrderViewModel get viewModel => _orderViewModel;
  @override
  void initState() {
    super.initState();

    _orderViewModel = OrderViewModel(
      orderOperation: OrderService(productNetworkManager),
      loginResponseCacheOperation:
          ProductStateItems.productCache.loginResponseCacheModel,
      sharedCacheOperation: ProductStateItems.productSharedCache,
    );

    _productNetworkErrorManager = ProductNetworkErrorManager(context);

    productNetworkManager.listenErrorState(
      onErrorStatus: (value) {
        _productNetworkErrorManager.handleError(value);
      },
    );

    viewModel.fetchOrders();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
