import 'package:flutter_vss/product/cache/core/cache_manager.dart';
import 'package:flutter_vss/product/cache/hive/hive_cache_operation.dart';
import 'package:flutter_vss/product/cache/model/order_cache_model.dart';
import 'package:flutter_vss/product/cache/model/user_cache_model.dart';

/// [ProductCache] is a cache manager for the product module.
final class ProductCache {
  ProductCache({required CacheManager cacheManager})
      : _cacheManager = cacheManager;

  final CacheManager _cacheManager;

  Future<void> init() async {
    await _cacheManager.init(
      items: [
        LoginResponseCacheModel.empty(),
        OrderCacheModel.empty(),
      ],
    );
  }

  late final HiveCacheOperation<LoginResponseCacheModel>
      loginResponseCacheModel = HiveCacheOperation<LoginResponseCacheModel>();

  late final HiveCacheOperation<OrderCacheModel> orderCacheModel =
      HiveCacheOperation<OrderCacheModel>();
}
