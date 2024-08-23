part of '../order_detail_view.dart';

class CheckOrdersNavigateButton extends StatelessWidget {
  const CheckOrdersNavigateButton({
    required this.onPressed,
    super.key,
  });


  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return FloatingButtonBuilder();
  }

  Widget FloatingButtonBuilder() {
    return BlocBuilder<OrderDetailViewModel, OrderDetailState>(
      builder: (BuildContext context, state) {
        if (!state.showButton) {
          return const SizedBox.shrink();
        }
        return FloatingActionButton.extended(
          backgroundColor: context.general.appTheme.colorScheme.primary,
          foregroundColor: Colors.white,
          onPressed: onPressed,
          label: Text(
            ProjectStrings.checkAndPrintWaybill,
            style: context.general.textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.w500, color: Colors.white),
          ),
        );
      },
    );
  }
}
