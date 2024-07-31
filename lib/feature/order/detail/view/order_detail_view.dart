import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vss/feature/order/detail/view/mixin/order_detail_view_mixin.dart';
import 'package:flutter_vss/feature/order/detail/view_model/order_detail_view_model.dart';
import 'package:flutter_vss/feature/order/detail/view_model/state/order_detail_base_state.dart';
import 'package:flutter_vss/feature/order/detail/view_model/state/order_detail_state.dart';
import 'package:flutter_vss/product/service/model/order/order.dart';
import 'package:flutter_vss/product/service/model/order/order_detail.dart';
import 'package:flutter_vss/product/utility/constants/product_padding.dart';
import 'package:flutter_vss/product/widget/product_listview.dart/product_listview_separated.dart';
import 'package:kartal/kartal.dart';

part 'widget/order_detail_appbar.dart';
part 'widget/order_detail_listview_separated.dart';

@RoutePage()
class OrderDetailView extends StatefulWidget {
  const OrderDetailView({
    super.key,
    required this.order,
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
      child: Padding(
        padding: const ProjectPadding.horizontalMedium() +
            const ProjectPadding.topSmall(),
        child: Scaffold(
            appBar: OrderDetailAppbar(
              title:
                  '${widget.order.sevkiyatYeri} - ${widget.order.siparisNumarasi}',
            ),
            body: BlocBuilder<OrderDetailViewModel, OrderDetailState>(
              builder: (BuildContext context, state) {
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return OrderDetailListviewSeparated(
                  orderDetails: state.orderDetailResponse?.orderLines ?? [],
                  onPressed: (int index) async => viewModel.scanBarcode(),
                );
              },
            )),
      ),
    );
  }
}
