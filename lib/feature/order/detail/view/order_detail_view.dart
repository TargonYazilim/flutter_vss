// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vss/feature/order/detail/view/mixin/order_detail_view_mixin.dart';
import 'package:flutter_vss/feature/order/detail/view_model/order_detail_view_model.dart';
import 'package:flutter_vss/feature/order/detail/view_model/state/order_detail_base_state.dart';
import 'package:flutter_vss/feature/order/detail/view_model/state/order_detail_state.dart';
import 'package:flutter_vss/product/service/model/order/order.dart';
import 'package:flutter_vss/product/service/model/order/order_detail.dart';
import 'package:flutter_vss/product/service/model/order/scan.dart';
import 'package:flutter_vss/product/utility/constants/product_padding.dart';
import 'package:flutter_vss/product/utility/constants/project_icons.dart';
import 'package:flutter_vss/product/utility/constants/project_strings.dart';
import 'package:flutter_vss/product/utility/custom_refresh_indicator.dart';
import 'package:flutter_vss/product/utility/modal_barrier/custom_modal_barrier.dart';
import 'package:flutter_vss/product/utility/size/widget_size.dart';
import 'package:flutter_vss/product/widget/product_listview.dart/product_listview_separated.dart';
import 'package:kartal/kartal.dart';

part 'widget/order_detail_appbar.dart';
part 'widget/order_detail_listview_separated.dart';
part 'widget/order_detail_loading.dart';
part 'widget/check_orders_navigate_button.dart';
part 'widget/decoration/product_listview_icon_decoration.dart';

@RoutePage()
class OrderDetailView extends StatefulWidget {
  const OrderDetailView({
    required this.order,
    super.key,
  });
  final Order order;

  @override
  State<OrderDetailView> createState() => _OrderDetailViewState();
}

class _OrderDetailViewState extends OrderDetailBaseState<OrderDetailView>
    with OrderDetailViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => viewModel,
      child: OrderDetailLoading(
        parentChild: Scaffold(
          floatingActionButton: CheckOrdersNavigateButton(
            onPressed: () => viewModel.pushToCheckOrdersView(context),
          ),
          appBar: OrderDetailAppbar(
            title:
                '${widget.order.sevkiyatYeri} - ${widget.order.siparisNumarasi}',
          ),
          body: _body(),
        ),
        loadingNotifier: viewModel.isLoading,
      ),
    );
  }

  Widget _body() {
    return Padding(
      padding: const ProjectPadding.horizontalMedium() +
          const ProjectPadding.topSmall(),
      child: CustomRefreshIndicator(
        onRefresh: () async => viewModel.getAllOrderDetailsFromCache(),
        isListView: true,
        child: OrderDetailListviewSeparated(
          onPressedBarcode: viewModel.scanBarcode,
          onDelete: (scan, index, innerIndex) =>
              viewModel.deleteScanBarcode(context, scan, index, innerIndex),
          onPressedManuel: (index) =>
              viewModel.scanBarcodeManuel(context, index),
        ),
      ),
    );
  }
}
