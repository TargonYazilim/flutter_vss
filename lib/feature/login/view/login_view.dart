import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vss/feature/login/view/mixin/login_view_mixin.dart';
import 'package:flutter_vss/feature/login/view_model/state/login_base_state.dart';
import 'package:flutter_vss/product/utility/constants/product_padding.dart';
import 'package:flutter_vss/product/utility/constants/project_strings.dart';
import 'package:flutter_vss/product/utility/constants/project_values.dart';
import 'package:flutter_vss/product/utility/custom_keyboard_dismisser.dart';
import 'package:flutter_vss/product/utility/size/widget_size.dart';
import 'package:flutter_vss/product/utility/validators/validator_items.dart';
import 'package:flutter_vss/product/widget/button/login/custom_login_button.dart';
import 'package:flutter_vss/product/widget/product_textfield.dart';

part '../view/widget/UsernamePasswordTextfield.dart';

@RoutePage()
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends LoginBaseState<LoginView> with LoginViewMixin {
  @override
  Widget build(BuildContext context) {
    return CustomKeyboardDismisser(
      child: Scaffold(
        floatingActionButton: Icon(Icons.add),
        body: Padding(
          padding: ProjectPadding.horizontalMedium(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Form(
                  key: viewModel.loginFormKey,
                  child: UsernamePasswordtextfield(
                    usernameController: viewModel.usernameController,
                    passwordController: viewModel.passwordController,
                  )),
              SizedBox(
                height: WidgetSizes.spacingXl,
              ),
              CustomLoginButton(
                onOperation: () async {
                  await viewModel.login();
                },
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
