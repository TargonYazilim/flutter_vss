import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vss/feature/transport/home/model/sevkiyat_model.dart';
import 'package:flutter_vss/product/utility/constants/product_padding.dart';
import 'package:kartal/kartal.dart';

part 'widget/transport_detail_appbar.dart';
part 'widget/transport_detail_listview_separated.dart';

@RoutePage()
class TransportDetailView extends StatelessWidget {
  const TransportDetailView({
    super.key,
    required this.sevkiyatModel,
  });
  final SevkiyatModel sevkiyatModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TransportDetailAppbar(
          title: '${sevkiyatModel.company} - ${sevkiyatModel.code}'),
      body: Padding(
        padding: ProjectPadding.horizontalMedium() + ProjectPadding.topSmall(),
        child: TransportDetailListViewSeparated(sevkiyatModel: sevkiyatModel),
      ),
    );
  }
}
