part of '../transport_detail_view.dart';

class TransportDetailAppbar extends StatelessWidget implements PreferredSizeWidget {
  const TransportDetailAppbar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      shadowColor: context.general.appTheme.colorScheme.shadow,
      title: Text(title,
          style: context.general.appTheme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: context.general.appTheme.colorScheme.onSurface)),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
