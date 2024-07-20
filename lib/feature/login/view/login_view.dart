import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vss/product/state/container/product_state_items.dart';

@RoutePage()
class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ProductStateItems.productViewModel.changeThemeMode(ThemeMode.light);
        },
        child: Icon(Icons.add),
      ),
      body: Container(),
    );
  }
}
