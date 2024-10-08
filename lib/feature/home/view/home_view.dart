import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vss/feature/home/view/widget/drawer_menu/drawer_items.dart';
import 'package:flutter_vss/feature/home/view_model/home_view_model.dart';
import 'package:flutter_vss/product/navigation/app_router.dart';
import 'package:flutter_vss/product/utility/constants/product_padding.dart';
import 'package:flutter_vss/product/utility/constants/project_images.dart';
import 'package:flutter_vss/product/utility/constants/project_strings.dart';
import 'package:flutter_vss/product/utility/custom_keyboard_dismisser.dart';
import 'package:flutter_vss/product/utility/size/widget_size.dart';
import 'package:kartal/kartal.dart';

part 'widget/drawer_menu/home_drawer_menu.dart';
part 'widget/home_appbar.dart';
part 'widget/home_card_button.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    return CustomKeyboardDismisser(
      child: Scaffold(
        drawer: const HomeDrawerMenu(),
        resizeToAvoidBottomInset: false,
        appBar: HomeAppbar(fullName: fullName ?? '-'),
        body: Padding(
          padding: const ProjectPadding.horizontalMedium(),
          child: _body(context),
          //child: _body(context),
        ),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: WidgetSizes.spacingXxl9),
        Row(
          children: [
            Expanded(
              child: HomeCardButton(
                text: ProjectStrings.order,
                onTab: () => context.router.push(const OrderRoute()),
                child: ProjectImages.imgOrder.toWidget(),
              ),
            ),
            Expanded(
              child: HomeCardButton(
                text: ProjectStrings.shipment,
                onTab: () {},
                child: ProjectImages.imgShipment.toWidget(),
              ),
            ),
          ],
        ),
        const Spacer(),
        const Text('Vibe'),
      ],
    );
  }
}
