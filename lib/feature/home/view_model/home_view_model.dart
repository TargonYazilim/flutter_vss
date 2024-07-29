import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vss/feature/home/view/home_view.dart';
import 'package:flutter_vss/product/cache/hive/hive_cache_operation.dart';
import 'package:flutter_vss/product/cache/model/user_cache_model.dart';
import 'package:flutter_vss/product/cache/shared/shared_cache_operation.dart';
import 'package:flutter_vss/product/navigation/app_router.dart';
import 'package:flutter_vss/product/state/container/product_state_items.dart';

abstract class HomeViewModel extends State<HomeView> {
  late final HiveCacheOperation<LoginResponseCacheModel>
      _loginResponseCacheOperation;

  late final SharedCacheOperation _sharedCacheOperation;

  @override
  void initState() {
    super.initState();

    _loginResponseCacheOperation =
        ProductStateItems.productCache.loginResponseCacheModel;
    _sharedCacheOperation = ProductStateItems.productSharedCache;
  }

  Future<void> logOut() async {
    _loginResponseCacheOperation.clear();
    await _sharedCacheOperation.clear();
    context.router.replace(SplashRoute());
  }
}
