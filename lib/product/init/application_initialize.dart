import 'dart:async';
import 'package:flutter_vss/product/state/container/product_state_container.dart';
import 'package:logger/logger.dart';
import 'package:flutter/material.dart';

@immutable
final class ApplicationInitialize {
  Future<void> make() async {
    WidgetsFlutterBinding.ensureInitialized();

    await runZonedGuarded<Future<void>>(
      _initialize,
      (error, stack) {
        Logger().e(error);
      },
    );
  }

  static Future<void> _initialize() async {
    FlutterError.onError = (details) {
      /// Crashlytics log insert here
      /// Custom service or custom logger insert here
      // Todo: add custom logger
      Logger().e(details.exceptionAsString());
    };

    ProductContainer.setup();
  }
}
