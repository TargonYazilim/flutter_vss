import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vss/feature/splash/view/mixin/splash_view_mixin.dart';
import 'package:flutter_vss/feature/splash/view_model/state/login_base_state.dart';

@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends SplashBaseState<SplashView>
    with SplashViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
