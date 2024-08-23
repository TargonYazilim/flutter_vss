part of '../login_view.dart';

class LoginSettingsButton extends StatelessWidget {
  const LoginSettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      backgroundColor: context.general.appTheme.colorScheme.primary,
      foregroundColor: Colors.white,
      onPressed: () {
        context.router.push(const SettingsRoute());
      },
      child: const Icon(Icons.settings),
    );
  }
}
