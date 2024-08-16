// ignore_for_file: public_member_api_docs

part of '../wayybill_view.dart';

class WayyBillAppbar extends StatelessWidget implements PreferredSizeWidget {
  const WayyBillAppbar({
    required this.title,
    super.key,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      shadowColor: context.general.appTheme.colorScheme.shadow,
      title: Text(
        title,
        style: context.general.appTheme.textTheme.titleSmall?.copyWith(
          fontWeight: FontWeight.bold,
          color: context.general.appTheme.colorScheme.onSurface,
        ),
      ),
      actions: [LoadingBlocBuilder()],
      centerTitle: true,
    );
  }

  Widget LoadingBlocBuilder() {
    return BlocBuilder<WayybillViewModel, WayybillState>(
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
