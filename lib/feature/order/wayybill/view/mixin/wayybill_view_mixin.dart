import 'package:flutter_vss/feature/order/wayybill/view/wayybill_view.dart';
import 'package:flutter_vss/feature/order/wayybill/view_model/state/wayybill_base_state.dart';
import 'package:flutter_vss/feature/order/wayybill/view_model/wayybill_view_model.dart';
import 'package:flutter_vss/product/service/order_service.dart';
import 'package:flutter_vss/product/service/wayy_bill_service.dart';

mixin WayybillViewMixin on WayybillBaseState<WayyBillView> {
  late WayybillViewModel _wayyBillViewModel;

  WayybillViewModel get viewModel => _wayyBillViewModel;

  @override
  void initState() {
    super.initState();

    _wayyBillViewModel = WayybillViewModel(
      wayyBillOperation: WayyBillService(productNetworkManager),
      order: widget.order,
      orderCacheOperation: productCache.orderCacheModel,
      orderOperation: OrderService(productNetworkManager),
      loginResponseCacheOperation: productCache.loginResponseCacheModel,
      sharedCacheOperation: productSharedCache,
      bluetoothOperation: bluetoothOperation,
    );

    _wayyBillViewModel
      ..getWayyBill()
      ..getAddressInfo()
      ..tryToBluetoothConnection(context);

    /*bluetoothOperation.listenConnection(
      (result) {
        ProductStateItems.toastService.showInfoMessage(message: result.value);
      },
    );*/
  }

  @override
  void dispose() {
    super.dispose();

    bluetoothOperation.stopListen();
  }
}
