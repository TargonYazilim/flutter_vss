import 'package:flutter_vss/feature/order/wayybill/view/wayybill_view.dart';
import 'package:flutter_vss/feature/order/wayybill/view_model/state/wayybill_base_state.dart';
import 'package:flutter_vss/feature/order/wayybill/view_model/wayybill_view_model.dart';
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
    );

    _wayyBillViewModel.getWayyBill();
  }
}
