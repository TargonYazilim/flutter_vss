import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vss/feature/login/view/login_view.dart';
import 'package:flutter_vss/feature/login/view_model/login_view_model.dart';
import 'package:flutter_vss/feature/login/view_model/state/login_base_state.dart';
import 'package:flutter_vss/product/navigation/app_router.dart';
import 'package:flutter_vss/product/service/login_service.dart';
import 'package:flutter_vss/product/service/manager/product_network_error_manager.dart';
import 'package:flutter_vss/product/state/container/product_state_items.dart';

mixin LoginViewMixin on LoginBaseState<LoginView> {
  late final ProductNetworkErrorManager _productNetworkErrorManager;

  late LoginViewModel _loginViewModel;

  LoginViewModel get viewModel => _loginViewModel;
  @override
  void initState() {
    super.initState();
    _loginViewModel = LoginViewModel(
      authenticationOperation: LoginService(productNetworkManager),
      loginResponseCacheOperation:
          ProductStateItems.productCache.loginResponseCacheModel,
      sharedCacheOperation: ProductStateItems.productSharedCache,
    );

    viewModel..usernameController = TextEditingController(text: 'T999')
    ..passwordController = TextEditingController(text: 'VİBE');

    _productNetworkErrorManager = ProductNetworkErrorManager(context);

    productNetworkManager.listenErrorState(
      onErrorStatus: (value) {
        _productNetworkErrorManager.handleError(value);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.usernameController.dispose();
    viewModel.passwordController.dispose();
  }

  /// If login is success, push to HomeView
  void pushToPage({required bool result}) {
    if (result) {
      context.router.replace(const HomeRoute());
    }
  }
}
