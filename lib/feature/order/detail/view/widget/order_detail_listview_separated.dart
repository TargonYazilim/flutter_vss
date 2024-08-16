part of '../order_detail_view.dart';

class OrderDetailListviewSeparated extends StatelessWidget {
  const OrderDetailListviewSeparated(
      {required this.onPressed, required this.onDelete, super.key});

  final void Function(int index) onPressed;
  final void Function(Scan scan, int index, int innerIndex) onDelete;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDetailViewModel, OrderDetailState>(
      builder: (BuildContext context, OrderDetailState state) {
        return ProductListviewSeparated<OrderDetail, Scan>(
          showScans: true,
          items: state.orderDetails ?? [],
          trailingOnPressed: (item, index) => onPressed.call(index),
          onDelete: onDelete.call,
          trailing: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Padding(
              padding: ProjectPadding.allSmall(),
              child: Icon(Icons.qr_code_scanner_rounded),
            ),
          ),
        );
      },
    );
  }
}
