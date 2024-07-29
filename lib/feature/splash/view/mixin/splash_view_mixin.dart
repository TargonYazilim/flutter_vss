import 'package:auto_route/auto_route.dart';
import 'package:flutter_vss/feature/splash/view/splash_view.dart';
import 'package:flutter_vss/feature/splash/view_model/splash_view_model.dart';
import 'package:flutter_vss/feature/splash/view_model/state/login_base_state.dart';
import 'package:flutter_vss/product/cache/hive/hive_cache_operation.dart';
import 'package:flutter_vss/product/cache/model/user_cache_model.dart';
import 'package:flutter_vss/product/cache/shared/key/shared_keys.dart';
import 'package:flutter_vss/product/cache/shared/shared_cache_operation.dart';
import 'package:flutter_vss/product/navigation/app_router.dart';
import 'package:flutter_vss/product/service/model/login/login_response.dart';
import 'package:flutter_vss/product/state/container/product_state_items.dart';

mixin SplashViewMixin on SplashBaseState<SplashView> {
  late SplashViewModel _splashViewModel;

  SplashViewModel get viewModel => _splashViewModel;

  late final HiveCacheOperation<LoginResponseCacheModel>
      _loginResponseCacheOperation;

  late final SharedCacheOperation _sharedCacheOperation;

  @override
  void initState() {
    super.initState();

    _loginResponseCacheOperation =
        ProductStateItems.productCache.loginResponseCacheModel;
    _sharedCacheOperation = ProductStateItems.productSharedCache;

    if (loginResponseFromCache?.token != null) {
      context.router.replace(HomeRoute());
    } else {
      context.router.replace(LoginRoute());
    }
  }

  /// Get users from hive cache
  LoginResponse? get loginResponseFromCache =>
      _loginResponseCacheOperation.get(userId ?? '')?.loginResponse;

  String? get userId => _sharedCacheOperation.get(SharedKeys.userId);
}
