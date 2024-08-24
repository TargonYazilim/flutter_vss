part of '../wayybill_view.dart';

class PrintWayybillFloatingButton extends StatelessWidget {
  const PrintWayybillFloatingButton({
    required this.onPressedBluetooth,
    required this.onPressed,
    super.key,
  });

  final void Function() onPressedBluetooth;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          heroTag: 'bluetooth',
          backgroundColor: Colors.blue,
          onPressed: onPressedBluetooth,
          child: const Icon(
            Icons.bluetooth,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: WidgetSizes.spacingS),
        FloatingActionButton.extended(
          heroTag: 'printer',
          backgroundColor: context.general.appTheme.colorScheme.primary,
          foregroundColor: Colors.white,
          onPressed: onPressed,
          label: Text(
            ProjectStrings.printWaybill,
            style: context.general.textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.w500, color: Colors.white),
          ),
          icon: const Icon(Icons.print_rounded, color: Colors.white),
        ),
      ],
    );
  }
}
