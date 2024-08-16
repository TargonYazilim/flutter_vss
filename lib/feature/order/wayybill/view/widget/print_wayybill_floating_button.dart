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
      onPressed: onPressed,
      label: Text(
        ProjectStrings.printWaybill,
        style: context.general.textTheme.titleMedium
            ?.copyWith(fontWeight: FontWeight.w500),
      ),
      icon: const Icon(Icons.print_rounded),
    );
  }
}
