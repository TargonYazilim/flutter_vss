import 'package:flutter_vss/product/cache/shared/key/shared_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// SharedPreferences operations
final class SharedCacheOperation {
  late final SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> clear() async {
    await _prefs.clear();
  }

  /// Add data to [SharedPreferences]
  /// [SharedKeys] is key. When you add or get data, you can use only [SharedKeys]
  Future<void> add(SharedKeys key, Object value) async => _saveData(key, value);

  /// Retrieve data from shared preferences
  T? get<T>(SharedKeys key) => _prefs.get(key.toString()) as T?;

  /// Save data to shared by Object convert
  Future<void> _saveData(SharedKeys key, Object obj) async {
    if (obj is String) {
      await _prefs.setString(key.toString(), obj);
    } else if (obj is bool) {
      await _prefs.setBool(key.toString(), obj);
    } else if (obj is int) {
      await _prefs.setInt(key.toString(), obj);
    } else if (obj is double) {
      await _prefs.setDouble(key.toString(), obj);
    }
  }
}
