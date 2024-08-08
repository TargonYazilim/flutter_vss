import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_vss/feature/splash/view/splash_view.dart';
import 'package:flutter_vss/feature/splash/view_model/splash_view_model.dart';
import 'package:flutter_vss/feature/splash/view_model/state/splash_base_state.dart';
import 'package:flutter_vss/product/cache/hive/hive_cache_operation.dart';
import 'package:flutter_vss/product/cache/shared/key/shared_keys.dart';
import 'package:flutter_vss/product/cache/shared/shared_cache_operation.dart';
import 'package:flutter_vss/product/navigation/app_router.dart';
import 'package:flutter_vss/product/service/barcode_service.dart';
import 'package:flutter_vss/product/service/model/login/login_response.dart';
import 'package:flutter_vss/product/service/order_service.dart';
import 'package:flutter_vss/product/state/container/product_state_items.dart';

mixin SplashViewMixin on SplashBaseState<SplashView> {
  late SplashViewModel _splashViewModel;

  SplashViewModel get viewModel => _splashViewModel;

  late final HiveCacheOperation<LoginResponse> _loginResponseCacheOperation;

  late final SharedCacheOperation _sharedCacheOperation;

  @override
  void initState() {
    super.initState();

    _splashViewModel = SplashViewModel(
      barcodeOperation: BarcodeService(dioNexusManager: productNetworkManager),
      barcodeCacheOperation: barcodeCacheOperation,
      orderOperation: OrderService(productNetworkManager),
      orderCacheOperation: orderCacheOperation,
    );

    _loginResponseCacheOperation =
        ProductStateItems.productCache.loginResponseCacheModel;
    _sharedCacheOperation = ProductStateItems.productSharedCache;

    _operationsAndNavigate();
  }

  Future<void> _operationsAndNavigate() async {
    if (loginResponseFromCache?.token != null) {
      await _getBarcodes();
      await _getUserOrders();
      if (!mounted) return;
      unawaited(context.router.replace(const HomeRoute()));
    } else {
      if (!mounted) return;
      unawaited(context.router.replace(const LoginRoute()));
    }
  }

  Future<void> _getBarcodes() async {
    await _splashViewModel.getBarcodesFromDb();
  }

  Future<void> _getUserOrders() async {
    await _splashViewModel.getOrdersFromDb(userId);
  }

  /// Get users from hive cache
  LoginResponse? get loginResponseFromCache =>
      _loginResponseCacheOperation.get(userId ?? '');

  /// UserId from cache
  String? get userId => _sharedCacheOperation.get(SharedKeys.userId);
}
