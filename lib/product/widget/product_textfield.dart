import 'package:flutter/material.dart';
import 'package:flutter_vss/product/decoration/product_textfield_decoration.dart';

class ProductTextfield extends StatelessWidget {
  const ProductTextfield({
    required this.maxLength,
    required this.labelText,
    super.key,
    this.enabled,
    this.validator,
    this.obscureText,
    this.controller,
  });
  final int maxLength;
  final String labelText;
  final bool? obscureText;
  final bool? enabled;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      autofocus: true,
      maxLength: maxLength,
      obscureText: obscureText ?? false,
      validator: validator,
      decoration:
          ProductTextfieldDecoration(context: context, labelText: labelText),
    );
  }
}
