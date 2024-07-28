
// The CacheManager class is an abstract class.
import 'package:flutter_vss/product/cache/core/cache_model.dart';

abstract class CacheManager {
  CacheManager({this.path});

  /// Make your cache initialization here.
  Future<void> init({required List<CacheModel> items});

  /// Remove all cache.
  void remove();

  /// [path] is the path to the directory for example testing.
  final String? path;
}
