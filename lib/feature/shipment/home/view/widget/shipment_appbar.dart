// ignore_for_file: public_member_api_docs

part of '../shipment_view.dart';

class ShipmentAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ShipmentAppbar({super.key});

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
      actions: [LoadingBlocBuilder()],
      centerTitle: true,
    );
  }

  Widget LoadingBlocBuilder() {
    return BlocBuilder<OrderViewModel, OrderState>(
      builder: (BuildContext context, state) {
        if (!state.isLoading) {
          return const SizedBox.shrink();
        }
        return const Padding(
          padding: ProjectPadding.rightSmall(),
          child: SizedBox(
            height: WidgetSizes.spacingXl,
            width: WidgetSizes.spacingXl,
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
