import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vss/feature/home/view/home_view.dart';
import 'package:flutter_vss/feature/login/view/login_view.dart';
import 'package:flutter_vss/feature/splash/view/splash_view.dart';
import 'package:flutter_vss/feature/transport/detail/view/transport_detail_view.dart';
import 'package:flutter_vss/feature/transport/home/model/transport_model.dart';
import 'package:flutter_vss/feature/transport/home/view/transport_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: TransportRoute.page),
        AutoRoute(page: TransportDetailRoute.page),
      ];
}
