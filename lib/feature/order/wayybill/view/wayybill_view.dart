// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vss/feature/order/wayybill/view/mixin/wayybill_view_mixin.dart';
import 'package:flutter_vss/feature/order/wayybill/view_model/state/wayybill_base_state.dart';
import 'package:flutter_vss/feature/order/wayybill/view_model/state/wayybill_state.dart';
import 'package:flutter_vss/feature/order/wayybill/view_model/wayybill_view_model.dart';
import 'package:flutter_vss/product/service/model/order/order.dart';
import 'package:flutter_vss/product/utility/constants/product_padding.dart';
import 'package:flutter_vss/product/utility/constants/project_strings.dart';
import 'package:flutter_vss/product/utility/constants/widget_sizes.dart';
import 'package:flutter_vss/product/utility/modal_barrier/custom_modal_barrier.dart';
import 'package:kartal/kartal.dart';

part 'widget/custom_text.dart';
part 'widget/delivared_recipient.dart';
part 'widget/print_wayybill_floating_button.dart';
part 'widget/scans_column.dart';
part 'widget/wayybill_appbar.dart';
part 'widget/wayybill_loading.dart';

@RoutePage()
class WayyBillView extends StatefulWidget {
  const WayyBillView({
    required this.order,
    super.key,
  });
  final Order order;

  @override
  State<WayyBillView> createState() => _WayyBillViewState();
}

class _WayyBillViewState extends WayybillBaseState<WayyBillView>
    with WayybillViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => viewModel,
      child: WayybillLoading(
        parentChild: Scaffold(
          floatingActionButton: PrintWayybillFloatingButton(
            onPressed: () async {
              await viewModel.saveOrdersToService();
            },
          ),
          appBar: WayyBillAppbar(
            title:
                '${widget.order.sevkiyatYeri} - ${widget.order.siparisNumarasi}',
          ),
          body: _body(),
        ),
      ),
    );
  }

  Widget _body() {
    return Padding(
      padding: const ProjectPadding.horizontalMedium() +
          const ProjectPadding.topNormal(),
      child: BlocBuilder<WayybillViewModel, WayybillState>(
        builder: (BuildContext context, WayybillState state) {
          if (state.isLoading) return const SizedBox.shrink();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                  text: state.addressInfo ?? ProjectStrings.noAddressDetail),
              const SizedBox(height: WidgetSizes.spacingM),
              CustomText(text: state.wayyBill?.baslik?.cariUnvan ?? '-'),
              CustomText(text: state.wayyBill?.baslik?.cariAdresi ?? '-'),
              CustomText(
                text:
                    '${state.wayyBill?.baslik?.cariVergiDairesi} ${state.wayyBill?.baslik?.cariVKN}',
              ),
              const SizedBox(height: WidgetSizes.spacingM),
              const SizedBox(height: WidgetSizes.spacingM),
              const CustomText(text: 'Teslimat adresi: Migros Ataşehir'),
              const SizedBox(height: WidgetSizes.spacingXl),
              const CustomText(text: 'İrsaliye No: 23323123'),
              const CustomText(text: 'Tarih Saat: 23.11.2024'),
              const SizedBox(height: WidgetSizes.spacingXl),
              ScansColumn(widget: widget),
              const SizedBox(height: WidgetSizes.spacingXxl3),
              const DelivaredRecipientRow(),
            ],
          );
        },
      ),
    );
  }
}
