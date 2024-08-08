import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vss/product/init/config/app_environment.dart';
import 'package:flutter_vss/product/state/container/product_state_container.dart';
import 'package:flutter_vss/product/state/container/product_state_items.dart';
import 'package:kartal/kartal.dart';
import 'package:logger/logger.dart';

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
    /// Use portrait mode for app
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    /// init app info for kartal package
    // TODO: Splash
    // TODO: Initializing without READ_DEVICE_CONFIG permission
    await DeviceUtility.instance.initPackageInfo();

    FlutterError.onError = (details) {
      /// Crashlytics log insert here
      /// Custom service or custom logger insert here
      // Todo: add custom logger
      Logger().e(details.exceptionAsString());
    };

    _productEnvironmentWithContainer();

    await _productCache();
  }

  static Future<void> _productCache() async {
    /// Init hive
    await ProductStateItems.productCache.init();

    /// Init shared preferences
    await ProductStateItems.productSharedCache.init();

    /// Register models
    ProductStateItems.productCache.register();

    /// Open cache models boxes
    await ProductStateItems.productCache.loginResponseCacheModel.open();
    await ProductStateItems.productCache.orderCacheModel.open();
    await ProductStateItems.productCache.barcodeCacheModel.open();
  }

  static void _productEnvironmentWithContainer() {
    /// AppEnvironment operations initialize
    AppEnvironment.general();

    /// Register GetIt instances
    /// It must bu call after [AppEnvironment.general()]
    ProductContainer.setup();
  }
}
