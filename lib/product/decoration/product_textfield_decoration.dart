import 'package:flutter/material.dart';
import 'package:flutter_vss/product/utility/constants/product_color.dart';
import 'package:kartal/kartal.dart';

final class ProductTextfieldDecoration extends InputDecoration {
  ProductTextfieldDecoration(
      {required BuildContext context, required String labelText})
      : super(
          filled: true,
          labelText: labelText,
          labelStyle: context.general.appTheme.textTheme.bodyLarge?.copyWith(
              color: ProductColor.hintColor, fontWeight: FontWeight.w600),
          focusedBorder: const UnderlineInputBorder(),
        );
}
