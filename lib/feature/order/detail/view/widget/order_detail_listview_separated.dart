part of '../order_detail_view.dart';

class OrderDetailListviewSeparated extends StatelessWidget {
  const OrderDetailListviewSeparated({
    required this.onPressedBarcode,
    required this.onPressedManuel,
    required this.onDelete,
    super.key,
  });

  final void Function(int index) onPressedBarcode;
  final void Function(int index) onPressedManuel;
  final void Function(Scan scan, int index, int innerIndex) onDelete;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDetailViewModel, OrderDetailState>(
      builder: (BuildContext context, OrderDetailState state) {
        return ProductListviewSeparated<OrderDetail, Scan>(
          showScans: true,
          items: state.orderDetails ?? [],
          onDelete: onDelete.call,
          trailingBuilder: (context, item, index) => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () => onPressedBarcode.call(index),
                child: ProductListviewIconDecoration(
                  child: ProjectIcons.iconBarcode.toWidget(),
                ),
              ),
              InkWell(
                onTap: () => onPressedManuel.call(index),
                child: ProductListviewIconDecoration(
                  child: Icon(
                    Icons.edit,
                    color: context.general.appTheme.colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
