part of '../check_orders_view.dart';

class CheckOrdersAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CheckOrdersAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      shadowColor: context.general.appTheme.colorScheme.shadow,
      title: Text(
        ProjectStrings.ordersCheckAppBarTitle,
        style: context.general.appTheme.textTheme.titleMedium?.copyWith(
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
