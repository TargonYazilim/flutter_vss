import 'package:flutter/material.dart';

final class BottomSheetBase<T> {
  /// Show a general bottom sheet
  /// [builder] for the sheet

  static Future<T?> show<T>({
    required BuildContext context,
    required WidgetBuilder builder,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      builder: builder,
    );
  }
}
