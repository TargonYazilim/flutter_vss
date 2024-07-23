import 'package:flutter/material.dart';
import 'package:flutter_vss/product/widget/product_listview.dart/base_listview_model.dart';
import 'package:kartal/kartal.dart';

part 'decoration/leading_decoration.dart';

class ProductListviewSeparated<T extends BaseListviewModel>
    extends StatelessWidget {
  const ProductListviewSeparated(
      {required this.items,
      this.onPressed,
      super.key,
      this.tralling,
      this.trallingOnPressed});

  final List<T> items;
  final void Function(T item)? onPressed;
  final void Function(T item, int index)? trallingOnPressed;
  final Widget? tralling;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () => onPressed?.call(items[index]),
            leading: LeadingDecoration(
                child: Text(items[index].title.toString().substring(0, 1),
                    style: context.general.appTheme.textTheme.titleMedium)),
            title: Text(items[index].title,
                style: context.general.appTheme.textTheme.titleMedium),
            trailing: tralling != null
                ? InkWell(
                    onTap: () => trallingOnPressed?.call(items[index], index),
                    child: tralling,
                  )
                : SizedBox.shrink(),
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider());
  }
}
