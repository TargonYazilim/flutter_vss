part of '../order_detail_view.dart';

class OrderDetailListviewSeparated extends StatelessWidget {
  const OrderDetailListviewSeparated(
      {super.key, required this.orders, required this.onPressed});
 
  final List<Order> orders;
  final void Function(int index) onPressed;

  @override
  Widget build(BuildContext context) {
    return ProductListviewSeparated(
      items: orders,
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
