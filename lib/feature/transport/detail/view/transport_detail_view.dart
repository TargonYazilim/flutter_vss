import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vss/feature/transport/detail/view/mixin/transport_detail_view_mixin.dart';
import 'package:flutter_vss/feature/transport/home/model/transport_model.dart';
import 'package:flutter_vss/product/utility/constants/product_padding.dart';
import 'package:flutter_vss/product/widget/product_listview.dart/product_listview_separated.dart';
import 'package:kartal/kartal.dart';

part 'widget/transport_detail_appbar.dart';
part 'widget/transport_detail_listview_separated.dart';

@RoutePage()
class TransportDetailView extends StatefulWidget {
  const TransportDetailView({
    super.key,
    required this.transportModel,
  });
  final TransportModel transportModel;

  @override
  State<TransportDetailView> createState() => _TransportDetailViewState();
}

class _TransportDetailViewState extends State<TransportDetailView>
    with TransportDetailViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TransportDetailAppbar(
          title:
              '${widget.transportModel.company} - ${widget.transportModel.code}'),
      body: Padding(
        padding: ProjectPadding.horizontalMedium() + ProjectPadding.topSmall(),
        child: TransportDetailListViewSeparated(
            transportModel: widget.transportModel,
            onPressed: (int index) async => viewModel.scanBarcode()),
      ),
    );
  }
}
