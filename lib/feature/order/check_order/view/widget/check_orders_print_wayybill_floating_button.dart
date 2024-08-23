part of '../check_orders_view.dart';

class CheckOrdersPrintWayybillFloatingButton extends StatelessWidget {
  const CheckOrdersPrintWayybillFloatingButton({
    required this.onPressed,
    super.key,
  });

  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: context.general.appTheme.colorScheme.primary,
      foregroundColor: Colors.white,
      onPressed: onPressed,
      label: Text(
        ProjectStrings.showWaybill,
        style: context.general.textTheme.titleMedium
            ?.copyWith(fontWeight: FontWeight.w500, color: Colors.white),
      ),
    );
  }
}
