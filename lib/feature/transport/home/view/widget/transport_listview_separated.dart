part of '../transport_view.dart';

class TransportListViewSeparated extends StatelessWidget {
  const TransportListViewSeparated({
    super.key,
    required this.list,
    required this.onPressed,
  });
  final List<TransportModel> list;
  final void Function(TransportModel transportModel) onPressed;
  @override
  Widget build(BuildContext context) {
    return ProductListviewSeparated<TransportModel>(
      items: list,
      onPressed: (transport) => onPressed.call(transport),
    );
  }
}
