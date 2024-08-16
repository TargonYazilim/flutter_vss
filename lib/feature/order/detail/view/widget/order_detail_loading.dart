
part of '../order_detail_view.dart';

class OrderDetailLoading extends StatelessWidget {
  const OrderDetailLoading({
    required this.loadingNotifier,
    required this.parentChild,
    super.key,
  });
  final ValueNotifier<bool> loadingNotifier;
  final Widget parentChild;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: loadingNotifier,
      builder: (BuildContext context, bool value, Widget? child) =>
          CustomModalBarrier(
        isLoading: value,
        child: parentChild,
      ),
    );
  }
}
