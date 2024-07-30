import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vss/feature/order/detail/view/mixin/order_detail_view_mixin.dart';
import 'package:flutter_vss/product/service/model/order/order.dart';
import 'package:flutter_vss/product/utility/constants/product_padding.dart';
import 'package:flutter_vss/product/widget/product_listview.dart/product_listview_separated.dart';
import 'package:kartal/kartal.dart';

part 'widget/order_detail_appbar.dart';
part 'widget/order_detail_listview_separated.dart';

@RoutePage()
class OrderDetailView extends StatefulWidget {
  const OrderDetailView({
    super.key,
    required this.orders,
  });
  final List<Order> orders;

  @override
  State<OrderDetailView> createState() => _OrderDetailViewState();
}

class _OrderDetailViewState extends State<OrderDetailView>
    with OrderDetailViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: OrderDetailAppbar(
            title:
                '${widget.orders.first.cariUnvan} - ${widget.orders.first.cariKodu}'),
        body: Padding(
            padding:
                ProjectPadding.horizontalMedium() + ProjectPadding.topSmall(),
            child: OrderDetailListviewSeparated(
              orders: widget.orders,
              onPressed: (int index) async => viewModel.scanBarcode(),
            )));
  }
}
