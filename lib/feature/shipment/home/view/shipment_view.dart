import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vss/feature/order/home/view_model/order_view_model.dart';
import 'package:flutter_vss/feature/order/home/view_model/state/order_state.dart';
import 'package:flutter_vss/feature/shipment/home/view/mixin/shipment_view_mixin.dart';
import 'package:flutter_vss/feature/shipment/home/view_model/state/shipment_base_state.dart';
import 'package:flutter_vss/product/navigation/app_router.dart';
import 'package:flutter_vss/product/service/model/order/order.dart';
import 'package:flutter_vss/product/service/model/order/scan.dart';
import 'package:flutter_vss/product/utility/constants/product_padding.dart';
import 'package:flutter_vss/product/utility/constants/project_strings.dart';
import 'package:flutter_vss/product/utility/constants/widget_sizes.dart';
import 'package:flutter_vss/product/utility/custom_refresh_indicator.dart';
import 'package:flutter_vss/product/widget/product_listview.dart/product_listview_separated.dart';
import 'package:kartal/kartal.dart';

part 'widget/shipment_appbar.dart';
part 'widget/shipment_listview_separated.dart';

@RoutePage()
class ShipmentView extends StatefulWidget {
  const ShipmentView({super.key});

  @override
  State<ShipmentView> createState() => _ShipmentViewState();
}

class _ShipmentViewState extends ShipmentBaseState<ShipmentView>
    with ShipmentViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => viewModel,
      child: Scaffold(
        appBar: const ShipmentAppbar(),
        body: _body(),
      ),
    );
  }

  Padding _body() {
    return Padding(
      padding: const ProjectPadding.horizontalMedium() +
          const ProjectPadding.topSmall(),
      child: CustomRefreshIndicator(
        onRefresh: () async {
          //viewModel.fetchOrdersFromDb()
        },
        isListView: true,
        child: ShipmentListViewSeparated(
          onPressed: (order, index) =>
              context.router.push(OrderDetailRoute(order: order)),
        ),
      ),
    );
  }
}
