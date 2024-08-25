import 'package:flutter/material.dart';
import 'package:flutter_vss/feature/home/view/home_view.dart';
import 'package:flutter_vss/product/cache/hive/hive_cache_operation.dart';
import 'package:flutter_vss/product/cache/shared/key/shared_keys.dart';
import 'package:flutter_vss/product/cache/shared/shared_cache_operation.dart';
import 'package:flutter_vss/product/service/model/login/login_response.dart';
import 'package:flutter_vss/product/state/container/product_state_items.dart';

abstract class HomeViewModel extends State<HomeView> {
  late final SharedCacheOperation _sharedCacheOperation;
  late final HiveCacheOperation<LoginResponse> _userHiveCacheOperation;
  @override
  void initState() {
    super.initState();

    _sharedCacheOperation = ProductStateItems.productSharedCache;
    _userHiveCacheOperation =
        ProductStateItems.productCache.loginResponseCacheModel;
  }

  String? get userId => _sharedCacheOperation.get(SharedKeys.userId);

  String? get fullName => _userHiveCacheOperation.get(userId ?? '')?.userInfo;
}
