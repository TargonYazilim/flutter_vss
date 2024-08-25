// ignore_for_file: public_member_api_docs

part of '../shipment_view.dart';

class ShipmentListViewSeparated extends StatelessWidget {
  const ShipmentListViewSeparated({
    required this.onPressed,
    super.key,
  });

  final void Function(Order orders, int index) onPressed;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderViewModel, OrderState>(
      builder: (BuildContext context, state) {
        return ProductListviewSeparated<Order, Scan>(
          items: state.orders ?? [],
          onPressed: onPressed.call,
        );
      },
    );
  }
}
