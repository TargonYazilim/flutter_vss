import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vss/product/state/container/product_state_items.dart';

@immutable
class StateInitialize extends StatelessWidget {
  const StateInitialize({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: ProductStateItems.productViewModel)
      ],
      child: child,
    );
  }
}
