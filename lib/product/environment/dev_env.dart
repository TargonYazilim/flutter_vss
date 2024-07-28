import 'package:envied/envied.dart';
import 'package:flutter_vss/product/environment/app_configuration.dart';

part 'dev_env.g.dart';

@Envied(obfuscate: true, path: 'assets/env/.dev.env')

/// Dev environment variables
final class DevEnv implements AppConfiguration {
  @EnviedField(varName: 'BASE_URL')
  static final String _baseUrl = _DevEnv._baseUrl;

  @EnviedField(varName: 'API_KEY')
  static final String _apiKey = _DevEnv._apiKey;

  @override
  String get apiKey => _apiKey;

  @override
  String get baseUrl => _baseUrl;
}
