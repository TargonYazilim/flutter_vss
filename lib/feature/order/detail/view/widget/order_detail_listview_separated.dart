part of '../order_detail_view.dart';

class OrderDetailListviewSeparated extends StatelessWidget {
  const OrderDetailListviewSeparated(
      {super.key, required this.orderDetails, required this.onPressed});

  final List<OrderDetail>? orderDetails;
  final void Function(int index) onPressed;

  @override
  Widget build(BuildContext context) {
    return ProductListviewSeparated<OrderDetail>(
      items: orderDetails ?? [],
      trallingOnPressed: (item, index) => onPressed.call(index),
      tralling: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        child: const Padding(
          padding: ProjectPadding.allSmall(),
          child: Icon(Icons.qr_code_scanner_rounded),
        ),
      ),
    );
  }
}
