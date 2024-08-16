part of '../order_detail_view.dart';

class OrderDetailPrintWayybillFloatingButton extends StatelessWidget {
  const OrderDetailPrintWayybillFloatingButton({
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
          onPressed: onPressed,
          label: Text(
            ProjectStrings.printWaybill,
            style: context.general.textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          icon: const Icon(Icons.print_rounded),
        );
      },
    );
  }
}
