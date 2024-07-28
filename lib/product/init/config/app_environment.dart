import 'package:flutter/foundation.dart';
import 'package:flutter_vss/product/environment/app_configuration.dart';
import 'package:flutter_vss/product/environment/dev_env.dart';
import 'package:flutter_vss/product/environment/prod_env.dart';

/// Application environment manager class
final class AppEnvironment {
  /// Setup application environment required initialize
  AppEnvironment.setup({required AppConfiguration config}) {
    _config = config;
  }

  /// General application environment setup
  AppEnvironment.general() {
    _config = kDebugMode ? DevEnv() : ProdEnv();
  }

  static late final AppConfiguration _config;

  /// Network base url
  static String get baseUrl => _config.baseUrl;

  /// Backend api key
  static String get apiKey => _config.apiKey;
}

/// Get application environment items
enum AppEnvironmentItems {
  /// Network base url
  baseUrl,

  /// Backend api key
  apiKey;

  /// Get application environment item value
  String get value {
    try {
      switch (this) {
        case AppEnvironmentItems.baseUrl:
          return AppEnvironment._config.baseUrl;
        case AppEnvironmentItems.apiKey:
          return AppEnvironment._config.apiKey;
      }
    } catch (e) {
      throw Exception('AppEnvironment is not initialized');
    }
  }
}
