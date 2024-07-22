part of '../transport_view.dart';

class TransportListViewSeparated extends StatelessWidget {
  const TransportListViewSeparated({
    super.key,
    required this.list,
    required this.onPressed,
  });
  final List<SevkiyatModel> list;
  final void Function(SevkiyatModel sevkiyatModel) onPressed;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          final sevkiyat = list[index];
          return ListTile(
            onTap: () => onPressed.call(sevkiyat),
            leading: ClipOval(
              child: Container(
                height: 40,
                width: 40,
                color: context.general.appTheme.colorScheme.secondary,
                child: Center(
                    child: Text(sevkiyat.company!.substring(0, 1),
                        style: context.general.appTheme.textTheme.titleMedium)),
              ),
            ),
            title: Text(
                '${sevkiyat.company} - ${sevkiyat.code} - ${sevkiyat.address}'),
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider());
  }
}
