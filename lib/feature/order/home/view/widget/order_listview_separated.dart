// ignore_for_file: public_member_api_docs

part of '../order_view.dart';

class OrderListViewSeparated extends StatelessWidget {
  const OrderListViewSeparated({
    super.key,
    required this.orders,
    required this.onPressed,
  });

  final List<Order> orders;
  final void Function(Order orders) onPressed;
  @override
  Widget build(BuildContext context) {
    return ProductListviewSeparated<Order>(
      items: orders,
      onPressed: onPressed.call,
    );
  }
}
