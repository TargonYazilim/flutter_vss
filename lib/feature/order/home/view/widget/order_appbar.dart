// ignore_for_file: public_member_api_docs

part of '../order_view.dart';

class OrderAppbar extends StatelessWidget implements PreferredSizeWidget {
  const OrderAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      shadowColor: context.general.appTheme.colorScheme.shadow,
      title: Text(
        ProjectStrings.orders,
        style: context.general.appTheme.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: context.general.appTheme.colorScheme.onSurface,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
