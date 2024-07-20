import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vss/product/utility/constants/product_padding.dart';
import 'package:flutter_vss/product/utility/constants/project_images.dart';
import 'package:flutter_vss/product/utility/constants/project_strings.dart';
import 'package:flutter_vss/product/utility/size/widget_size.dart';
import 'package:kartal/kartal.dart';

part 'widget/home_card_button.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VSS'),
        centerTitle: true,
      ),
      body: Padding(
        padding: ProjectPadding.verticalSmall(),
        child: _bodyRow(context),
      ),
    );
  }

  Row _bodyRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: HomeCardButton(
            text: ProjectStrings.transport,
            child: ProjectImages.imgTransport.toWidget(),
          ),
        ),
        Expanded(
            child: HomeCardButton(
          text: ProjectStrings.shipment,
          child: ProjectImages.imgShipment.toWidget(),
        )),
      ],
    );
  }
}
