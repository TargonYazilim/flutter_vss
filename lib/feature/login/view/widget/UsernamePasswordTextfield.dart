part of '../login_view.dart';

class UsernamePasswordtextfield extends StatelessWidget {
  const UsernamePasswordtextfield({
    super.key,
    required this.usernameController,
    required this.passwordController,
  });
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ProductTextfield(
            controller: usernameController,
            validator: (value) => ValidatorItems(value).validateUsername,
            maxLength: ProjectValues.usernameMaxLength,
            labelText: ProjectStrings.username),
        SizedBox(height: WidgetSizes.spacingS),
        ProductTextfield(
            controller: passwordController,
            validator: (value) => ValidatorItems(value).validatePassword,
            obscureText: true,
            maxLength: ProjectValues.passwordMaxLength,
            labelText: ProjectStrings.password),
      ],
    );
  }
}
