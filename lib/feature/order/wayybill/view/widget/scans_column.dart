part of '../wayybill_view.dart';

class ScansColumn extends StatelessWidget {
  const ScansColumn({
    super.key,
    required this.widget,
  });

  final WayyBillView widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widget.order.orderDetails!
          .map(
            (detail) => Text(
              '${detail.malzemeAdi} - ${detail.scans?.length ?? 0}',
              style: context.general.appTheme.textTheme.titleMedium?.copyWith(
                color: context.general.appTheme.colorScheme.onSurface,
              ),
            ),
          )
          .toList(),
    );
  }
}
