import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.isLoading = false,
    required this.onOperation,
  });
  final bool? isLoading;
  final String text;
  final AsyncCallback onOperation;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onOperation,
        child: Center(
          child: (isLoading ?? false)
              ? CircularProgressIndicator(color: Colors.white)
              : Text(
                  text,
                  style: context.general.appTheme.textTheme.labelLarge
                      ?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                ),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: context.general.appTheme.colorScheme.primary));
  }
}
