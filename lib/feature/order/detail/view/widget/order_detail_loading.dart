import 'package:flutter/material.dart';
import 'package:flutter_vss/product/utility/modal_barrier/custom_modal_barrier.dart';

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
