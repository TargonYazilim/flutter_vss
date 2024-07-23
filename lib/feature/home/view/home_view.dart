import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vss/product/navigation/app_router.dart';
import 'package:flutter_vss/product/state/container/product_state_items.dart';
import 'package:flutter_vss/product/utility/constants/product_padding.dart';
import 'package:flutter_vss/product/utility/constants/project_images.dart';
import 'package:flutter_vss/product/utility/constants/project_strings.dart';
import 'package:flutter_vss/product/utility/size/widget_size.dart';
import 'package:kartal/kartal.dart';

part 'widget/home_appbar.dart';
part 'widget/home_card_button.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppbar(),
      backgroundColor: context.general.appTheme.colorScheme.surface,
      body: Padding(
        padding: ProjectPadding.horizontalMedium(),
        child: _body(context),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: WidgetSizes.spacingXxl9),
        Row(
          children: [
            Expanded(
              child: HomeCardButton(
                text: ProjectStrings.transport,
                onTab: () => context.router.push(TransportRoute()),
                child: ProjectImages.imgTransport.toWidget(),
              ),
            ),
            Expanded(
                child: HomeCardButton(
              text: ProjectStrings.shipment,
              onTab: () {
                ProductStateItems.toastService
                    .showErrorMessage(message: 'Oldu');
                ProductStateItems.toastService
                    .showSuccessMessage(message: 'Oldu');
                ProductStateItems.toastService.showInfoMessage(message: 'Oldu');
              },
              child: ProjectImages.imgShipment.toWidget(),
            )),
          ],
        ),
        const Spacer(),
        Text('Vibe'),
      ],
    );
  }
}
