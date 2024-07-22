part of '../transport_view.dart';

class TransportAppbar extends StatelessWidget implements PreferredSizeWidget {
  const TransportAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      shadowColor: context.general.appTheme.colorScheme.shadow,
      title: Text(ProjectStrings.transports,
          style: context.general.appTheme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: context.general.appTheme.colorScheme.onSurface)),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
