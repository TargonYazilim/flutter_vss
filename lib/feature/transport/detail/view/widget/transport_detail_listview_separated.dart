part of '../transport_detail_view.dart';

class TransportDetailListViewSeparated extends StatelessWidget {
  const TransportDetailListViewSeparated({
    super.key,
    required this.transportModel,
    required this.onPressed,
  });
  final TransportModel transportModel;
  final void Function(int index) onPressed;
  @override
  Widget build(BuildContext context) {
    return ProductListviewSeparated(
      items: transportModel.details,
      trallingOnPressed: (item, index) => onPressed.call(index),
      tralling: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        child: Padding(
          padding: ProjectPadding.allSmall(),
          child: Icon(Icons.qr_code_scanner_rounded),
        ),
      ),
    );
  }
}
