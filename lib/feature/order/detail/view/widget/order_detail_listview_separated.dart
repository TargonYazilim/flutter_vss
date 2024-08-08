part of '../order_detail_view.dart';

class OrderDetailListviewSeparated extends StatelessWidget {
  const OrderDetailListviewSeparated({required this.onPressed, super.key});

  final void Function(int index) onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDetailViewModel, OrderDetailState>(
      builder: (BuildContext context, OrderDetailState state) {
        return ProductListviewSeparated<OrderDetail>(
          items: state.orderDetails ?? [],
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
      },
    );
  }
}
