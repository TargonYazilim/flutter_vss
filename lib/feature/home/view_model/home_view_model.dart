import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vss/feature/home/view/home_view.dart';
import 'package:flutter_vss/product/cache/shared/shared_cache_operation.dart';
import 'package:flutter_vss/product/navigation/app_router.dart';
import 'package:flutter_vss/product/state/container/product_state_items.dart';

abstract class HomeViewModel extends State<HomeView> {
  late final SharedCacheOperation _sharedCacheOperation;

  @override
  void initState() {
    super.initState();

    _sharedCacheOperation = ProductStateItems.productSharedCache;
  }

  Future<void> logOut() async {
    await ProductStateItems.productCache.removeFromDisk();
    await _sharedCacheOperation.clear();
    if (!mounted) return;
    unawaited(context.router.replace(const SplashRoute()));
  }
}
