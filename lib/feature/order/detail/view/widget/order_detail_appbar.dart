part of '../order_detail_view.dart';

class OrderDetailAppbar extends StatelessWidget implements PreferredSizeWidget {
  const OrderDetailAppbar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      shadowColor: context.general.appTheme.colorScheme.shadow,
      title: Text(
        title,
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
    return BlocBuilder<OrderDetailViewModel, OrderDetailState>(
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
