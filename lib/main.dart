import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vss/product/init/application_initialize.dart';
import 'package:flutter_vss/product/init/state_initialize.dart';
import 'package:flutter_vss/product/init/theme/custom_dark_theme.dart';
import 'package:flutter_vss/product/init/theme/custom_light_theme.dart';
import 'package:flutter_vss/product/navigation/app_router.dart';
import 'package:flutter_vss/product/state/view_model/product_view_model.dart';

Future<void> main() async {
  await ApplicationInitialize().make();

  runApp(
    StateInitialize(child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final _appRouter = AppRouter();

    return MaterialApp.router(
      
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
      theme: CustomLightTheme().themeData,
      darkTheme: CustomDarkTheme().themeData,
      themeMode: context.watch<ProductViewModel>().state.themeMode,
    );
  }
}
