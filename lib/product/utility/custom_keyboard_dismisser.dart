import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class CustomKeyboardDismisser extends StatelessWidget {
  const CustomKeyboardDismisser( {required this.child, super.key});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(child: child);
  }
}
