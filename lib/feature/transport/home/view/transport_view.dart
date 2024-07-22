import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vss/feature/transport/home/model/sevkiyat_model.dart';
import 'package:flutter_vss/product/navigation/app_router.dart';
import 'package:flutter_vss/product/utility/constants/product_padding.dart';
import 'package:flutter_vss/product/utility/constants/project_strings.dart';
import 'package:kartal/kartal.dart';

part 'widget/transport_appbar.dart';
part 'widget/transport_listview_separated.dart';

@RoutePage()
class TransportView extends StatelessWidget {
  const TransportView({super.key});

  @override
  Widget build(BuildContext context) {
    final list = SevkiyatModel.dummy();
    return Scaffold(
      appBar: TransportAppbar(),
      body: Padding(
        padding: ProjectPadding.horizontalMedium() + ProjectPadding.topSmall(),
        child: TransportListViewSeparated(
          list: list,
          onPressed: (sevkiyatModel) {
            context.router
                .push(TransportDetailRoute(sevkiyatModel: sevkiyatModel));
          },
        ),
      ),
    );
  }
}
