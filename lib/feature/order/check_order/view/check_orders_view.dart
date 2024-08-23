import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vss/product/navigation/app_router.dart';
import 'package:flutter_vss/product/service/model/order/order.dart';
import 'package:flutter_vss/product/service/model/order/order_detail.dart';
import 'package:flutter_vss/product/utility/constants/product_padding.dart';
import 'package:flutter_vss/product/utility/constants/project_strings.dart';
import 'package:flutter_vss/product/widget/product_listview.dart/product_summary_separated.dart';
import 'package:kartal/kartal.dart';

part 'widget/check_orders_appbar.dart';
part 'widget/check_orders_print_wayybill_floating_button.dart';

@RoutePage()
class CheckOrdersView extends StatelessWidget {
  const CheckOrdersView({required this.order, super.key});

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CheckOrdersPrintWayybillFloatingButton(
        onPressed: () => context.router.push(WayyBillRoute(order: order)),
      ),
      appBar: const CheckOrdersAppbar(),
      body: _body(),
    );
  }

  Widget _body() => Padding(
        padding: const ProjectPadding.horizontalMedium() +
            const ProjectPadding.topSmall(),
        child: ProductSummarySeparated<OrderDetail>(
          items: order.orderDetails ?? [],
        ),
      );
}
