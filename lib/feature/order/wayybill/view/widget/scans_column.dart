part of '../wayybill_view.dart';

class ScansColumn extends StatelessWidget {
  const ScansColumn({
    required this.widget,
    super.key,
  });

  final WayyBillView widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widget.order.orderDetails!
          .map(
            (detail) => Text(
              '${detail.malzemeAdi}\n'
              '${detail.scans?.length ?? 0} ${detail.birim}     '
              '${detail.totalScanAmount} '
              '${detail.totalScanAmount != '' ? 'KG' : ''}',
              style: context.general.appTheme.textTheme.titleMedium?.copyWith(
                color: context.general.appTheme.colorScheme.onSurface,
              ),
            ),
          )
          .toList(),
    );
  }
}
