import 'package:flutter/material.dart';
import 'package:flutter_vss/product/widget/product_listview.dart/base_summary_listview_model.dart';
import 'package:flutter_vss/product/widget/product_listview.dart/product_listview_separated.dart';
import 'package:kartal/kartal.dart';

class ProductSummarySeparated<T extends BaseSummaryListviewModel<T>>
    extends StatelessWidget {
  const ProductSummarySeparated({required this.items, super.key});

  final List<T> items;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: items.length + 1,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        if (index != items.length) {
          return ListTile(
            leading: LeadingDecoration(
              child: Text(
                items[index].summaryTitle.substring(0, 1),
                style: context.general.appTheme.textTheme.titleMedium?.copyWith(
                  color: context.general.appTheme.colorScheme.surface,
                ),
              ),
            ),
            title: Text(
              items[index].summaryTitle,
              style: context.general.appTheme.textTheme.titleMedium,
            ),
          );
        } else {
          const SizedBox.shrink();
        }
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
