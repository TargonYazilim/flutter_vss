import 'package:flutter_vss/product/widget/product_listview.dart/sub_listview_model.dart';

mixin BaseListviewModel<T, R extends SubListviewModel<R>> {
  String get title;
  List<R> get subList;
}
