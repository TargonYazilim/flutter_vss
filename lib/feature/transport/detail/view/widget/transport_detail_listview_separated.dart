part of '../transport_detail_view.dart';

class TransportDetailListViewSeparated extends StatelessWidget {
  const TransportDetailListViewSeparated({
    super.key,
    required this.sevkiyatModel,
    required this.onPressed,
  });
  final SevkiyatModel sevkiyatModel;
  final void Function(int index) onPressed;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: sevkiyatModel.details.length,
        itemBuilder: (BuildContext context, int index) {
          final sevkiyatDetail = sevkiyatModel.details[index];
          return ListTile(
            leading: ClipOval(
              child: Container(
                height: 40,
                width: 40,
                color: context.general.appTheme.colorScheme.secondary,
                child: Center(
                    child: Text(sevkiyatDetail.substring(0, 1),
                        style: context.general.appTheme.textTheme.titleMedium)),
              ),
            ),
            title: Text(sevkiyatDetail),
            trailing: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: IconButton(
                    onPressed: () => onPressed.call(index),
                    icon: Icon(Icons.qr_code_scanner_rounded))),
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider());
  }
}
