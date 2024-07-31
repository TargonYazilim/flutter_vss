import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vss/feature/order/home/view/widget/mixin/order_view_mixin.dart';
import 'package:flutter_vss/feature/order/home/view_model/order_view_model.dart';
import 'package:flutter_vss/feature/order/home/view_model/state/order_base_state.dart';
import 'package:flutter_vss/feature/order/home/view_model/state/order_state.dart';
import 'package:flutter_vss/product/navigation/app_router.dart';
import 'package:flutter_vss/product/service/model/order/order.dart';
import 'package:flutter_vss/product/utility/constants/product_padding.dart';
import 'package:flutter_vss/product/utility/constants/project_strings.dart';
import 'package:flutter_vss/product/widget/product_listview.dart/product_listview_separated.dart';
import 'package:kartal/kartal.dart';

part 'widget/order_appbar.dart';
part 'widget/order_listview_separated.dart';

@RoutePage()
class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends OrderBaseState<OrderView> with OrderViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => viewModel,
      child: Scaffold(
        appBar: const OrderAppbar(),
        body: BlocBuilder<OrderViewModel, OrderState>(
          builder: (BuildContext context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return Padding(
              padding: const ProjectPadding.horizontalMedium() +
                  const ProjectPadding.topSmall(),
              child: OrderListViewSeparated(
                  orders: state.orderResponse?.orders ?? [],
                  onPressed: (order) =>
                      context.router.push(OrderDetailRoute(order: order))),
            );
          },
        ),
      ),
    );
  }
}
/*

return BlocBuilder<HomeViewModel, HomeState>(
      builder: (context, state) {
        if (!state.isLoading) return const SizedBox.shrink();
        return const CircularProgressIndicator.adaptive();
      },
    );
*/