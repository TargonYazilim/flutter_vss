// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_vss/product/utility/constants/product_padding.dart';
import 'package:flutter_vss/product/widget/product_listview.dart/base_listview_model.dart';
import 'package:flutter_vss/product/widget/product_listview.dart/sub_listview_model.dart';
import 'package:kartal/kartal.dart';

part 'decoration/leading_decoration.dart';

class ProductListviewSeparated<T extends BaseListviewModel<T, R>,
    R extends SubListviewModel<R>> extends StatelessWidget {
  const ProductListviewSeparated({
    required this.items,
    this.onPressed,
    this.onDelete,
    super.key,
    this.trailingBuilder,
    this.showScans = false,
  });

  final List<T> items;
  final void Function(T item, int index)? onPressed;
  final Widget Function(BuildContext context, T item, int index)?
      trailingBuilder;
  final void Function(R item, int index, int innerIndex)? onDelete;
  final bool? showScans;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.topSmall(),
      child: ListView.separated(
        itemCount: items.length + 1,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          if (index != items.length) {
            return Column(
              children: [
                ListTile(
                  onTap: () => onPressed?.call(items[index], index),
                  leading: LeadingDecoration(
                    child: Text(
                      items[index].title.substring(0, 1),
                      style: context.general.appTheme.textTheme.titleMedium
                          ?.copyWith(
                        color: context.general.appTheme.colorScheme.surface,
                      ),
                    ),
                  ),
                  title: Text(
                    items[index].title,
                    style: context.general.appTheme.textTheme.titleMedium,
                  ),
                  subtitle: items[index].subTitle != null
                      ? Text(
                          items[index].subTitle!,
                          style: context.general.appTheme.textTheme.titleMedium,
                        )
                      : null,
                  trailing: trailingBuilder != null
                      ? trailingBuilder!(context, items[index], index)
                      : const SizedBox.shrink(),
                ),
                if (showScans ?? false)
                  ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: items[index].subList.length,
                    itemBuilder: (BuildContext context, int innerIndex) {
                      return Card(
                        child: ListTile(
                          title: Text(items[index].subList[innerIndex].title),
                          trailing: IconButton(
                            onPressed: () => onDelete?.call(
                              items[index].subList[innerIndex],
                              index,
                              innerIndex,
                            ),
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      );
                    },
                  )
                else
                  const SizedBox.shrink(),
              ],
            );
          } else {
            return SizedBox(
              height: context.sized.dynamicHeight(0.2),
            );
          }
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
