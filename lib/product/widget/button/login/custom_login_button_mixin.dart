import 'package:flutter/material.dart';
import 'package:flutter_vss/product/state/mounted_mixin.dart';
import 'package:flutter_vss/product/widget/button/login/custom_login_button.dart';

mixin CustomLoginButtonMixin
    on State<CustomLoginButton>, MountedMixin<CustomLoginButton> {
  final ValueNotifier<bool> isLoadingNotifier = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    isLoadingNotifier.value = false;
  }

  Future<void> onPressed() async {
    isLoadingNotifier.value = true;
    await widget.onOperation.call();
    await safeOperationAsync(() async {
      isLoadingNotifier.value = false;
    });
  }
}
