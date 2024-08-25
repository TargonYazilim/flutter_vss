// ignore_for_file: public_member_api_docs

import 'package:flutter_vss/feature/shipment/home/view/shipment_view.dart';
import 'package:flutter_vss/feature/shipment/home/view_model/shipment_view_model.dart';
import 'package:flutter_vss/feature/shipment/home/view_model/state/shipment_base_state.dart';
import 'package:flutter_vss/product/service/manager/product_network_error_manager.dart';

mixin ShipmentViewMixin on ShipmentBaseState<ShipmentView> {
  late final ProductNetworkErrorManager _productNetworkErrorManager;

  late ShipmentViewModel _viewModel;

  ShipmentViewModel get viewModel => _viewModel;
  @override
  void initState() {
    super.initState();

    _viewModel = ShipmentViewModel();

    //TODO: check this metot
    _productNetworkErrorManager = ProductNetworkErrorManager(context);

    productNetworkManager.listenErrorState(
      onErrorStatus: (value) {
        _productNetworkErrorManager.handleError(value);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
