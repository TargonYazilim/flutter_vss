part of '../wayybill_view.dart';

class PrintWayybillFloatingButton extends StatelessWidget {
  const PrintWayybillFloatingButton({
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
        ProjectStrings.printWaybill,
        style: context.general.textTheme.titleMedium
            ?.copyWith(fontWeight: FontWeight.w500, color: Colors.white),
      ),
      icon: const Icon(Icons.print_rounded, color: Colors.white),
    );
  }
}
