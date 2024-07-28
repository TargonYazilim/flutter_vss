import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vss/product/state/mounted_mixin.dart';
import 'package:flutter_vss/product/utility/constants/project_strings.dart';
import 'package:flutter_vss/product/widget/button/custom_button.dart';
import 'package:flutter_vss/product/widget/button/login/custom_login_button_mixin.dart';

class CustomLoginButton extends StatefulWidget {
  const CustomLoginButton({super.key, required this.onOperation});

  final AsyncCallback onOperation;

  @override
  State<CustomLoginButton> createState() => _CustomLoginButtonState();
}

class _CustomLoginButtonState extends State<CustomLoginButton>
    with MountedMixin, CustomLoginButtonMixin {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isLoadingNotifier,
      builder: (BuildContext context, bool value, Widget? child) {
        return CustomButton(
          isLoading: value,
          text: ProjectStrings.login,
          onOperation: onPressed,
        );
      },
    );
  }
}
