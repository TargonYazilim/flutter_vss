import 'package:flutter/material.dart';
import 'package:flutter_vss/product/utility/constants/product_padding.dart';
import 'package:flutter_vss/product/utility/constants/project_strings.dart';
import 'package:flutter_vss/product/widget/dialog/base/dialog_base.dart';
import 'package:kartal/kartal.dart';

/// Show a dialog for question

class QuestionDialog extends StatefulWidget {
  /// Constructor for AlertDialog

  const QuestionDialog({required this.title, super.key});

  /// Title for dialog

  final String title;

  static Future<bool?> show({
    required BuildContext context,
    required String title,
  }) async {
    return DialogBase.show<bool>(
      context: context,
      builder: (context) => QuestionDialog(title: title),
    );
  }

  @override
  State<QuestionDialog> createState() => _QuestionDialogState();
}

class _QuestionDialogState extends State<QuestionDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: Padding(
        padding: const ProjectPadding.allMedium(),
        child: Text(
          widget.title,
          style: context.general.textTheme.titleLarge?.copyWith(
            color: context.general.appTheme.colorScheme.onSurface,
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text(
            ProjectStrings.cancel,
            style: context.general.textTheme.titleSmall?.copyWith(
              color: context.general.appTheme.colorScheme.onSurface,
            ),
          ),
        ),
        FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: context.general.appTheme.colorScheme.error,
          ),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: Text(
            ProjectStrings.ok,
            style: context.general.textTheme.titleSmall?.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
