import 'package:flutter_vss/feature/order/detail/view/order_detail_view.dart';
import 'package:flutter_vss/feature/order/detail/view_model/order_detail_view_model.dart';
import 'package:flutter_vss/feature/order/detail/view_model/state/order_detail_base_state.dart';
import 'package:flutter_vss/product/service/order_service.dart';
import 'package:flutter_vss/product/service/scan_service.dart';
import 'package:flutter_vss/product/state/container/product_state_items.dart';
import 'package:flutter_vss/product/utility/barcode/custom_barcode_scanner.dart';

mixin OrderDetailViewMixin on OrderDetailBaseState<OrderDetailView> {
  late OrderDetailViewModel _orderDetailViewModel;

  OrderDetailViewModel get viewModel => _orderDetailViewModel;

  @override
  void initState() {
    super.initState();

    _orderDetailViewModel = OrderDetailViewModel(
      barcodeScanner: CustomBarcodeScanner(),
      orderOperation: OrderService(productNetworkManager),
      scanOperation: ScanService(productNetworkManager),
      order: widget.order,
      orderCacheOperation: ProductStateItems.productCache.orderCacheModel,
      barcodeCacheOperation: ProductStateItems.productCache.barcodeCacheModel,
    );

    viewModel.getAllOrderDetailsFromCache();
  }
}
