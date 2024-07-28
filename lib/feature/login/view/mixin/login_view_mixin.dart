import 'package:flutter/material.dart';
import 'package:flutter_vss/feature/login/view/login_view.dart';
import 'package:flutter_vss/feature/login/view_model/login_view_model.dart';
import 'package:flutter_vss/feature/login/view_model/state/login_base_state.dart';
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
      loginResponseCacheOperation: ProductStateItems.productCache.loginResponseCacheModel,
    );

    viewModel.usernameController = TextEditingController(text: 'T9991');
    viewModel.passwordController = TextEditingController(text: 'VİBE');

    _productNetworkErrorManager = ProductNetworkErrorManager(context);

    productNetworkManager.listenErrorState(
      onErrorStatus: (value) {
        _productNetworkErrorManager.handleError(value);
      },
    );

    print("Login Response = ${viewModel.loginResponseFromCache}");
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.usernameController.dispose();
    viewModel.passwordController.dispose();
  }
}
