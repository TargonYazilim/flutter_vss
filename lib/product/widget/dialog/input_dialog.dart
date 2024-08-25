import 'package:flutter/material.dart';
import 'package:flutter_vss/product/utility/constants/project_strings.dart';
import 'package:flutter_vss/product/widget/dialog/base/dialog_base.dart';
import 'package:kartal/kartal.dart';

/// User question answer
class QuestionAnswer {
  QuestionAnswer({required this.response});

  /// Answer test
  final String response;
}

class InputDialog extends StatefulWidget {
  const InputDialog({
    required this.title,
    super.key,
  });

  /// Title for dialog
  final String title;

  /// Show the dialog for question
  /// This will always return [QuestionAnswer]
  static Future<QuestionAnswer?> show({
    required BuildContext context,
    required String title,
  }) async {
    return DialogBase.show<QuestionAnswer>(
      context: context,
      builder: (context) => InputDialog(title: title),
    );
  }

  @override
  State<InputDialog> createState() => _InputDialogState();
}

class _InputDialogState extends State<InputDialog> {
  String _response = '';
  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: Text(widget.title),
      content: TextField(
        autofocus: true,
        onChanged: (value) => _response = value,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
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
            if (_response.isEmpty) {
              Navigator.of(context).pop();
            } else {
              Navigator.of(context).pop(QuestionAnswer(response: _response));
            }
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
