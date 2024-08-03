import 'package:flutter_vss/product/cache/core/cache_manager.dart';
import 'package:flutter_vss/product/cache/hive/hive_cache_operation.dart';
import 'package:flutter_vss/product/service/model/login/login_response.dart';
import 'package:flutter_vss/product/service/model/order/order.dart';

/// [ProductCache] is a cache manager for the product module.
final class ProductCache {
  ProductCache({required CacheManager cacheManager})
      : _cacheManager = cacheManager;

  final CacheManager _cacheManager;

  Future<void> init() async {
    await _cacheManager.init();
  }

  /// Register cache models
  void register() {
    _cacheManager.register();
  }

  /// Clear all from disk caches
  Future<void> removeFromDisk() async {
    await _cacheManager.remove();
  }

  late final HiveCacheOperation<LoginResponse> loginResponseCacheModel =
      HiveCacheOperation<LoginResponse>();

  late final HiveCacheOperation<Order> orderCacheModel =
      HiveCacheOperation<Order>();
}
