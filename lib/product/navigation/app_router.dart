import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vss/feature/home/view/home_view.dart';
import 'package:flutter_vss/feature/login/view/login_view.dart';
import 'package:flutter_vss/feature/order/check_order/view/check_orders_view.dart';
import 'package:flutter_vss/feature/order/detail/view/order_detail_view.dart';
import 'package:flutter_vss/feature/order/home/view/order_view.dart';
import 'package:flutter_vss/feature/order/wayybill/view/wayybill_view.dart';
import 'package:flutter_vss/feature/settings/view/settings_view.dart';
import 'package:flutter_vss/feature/shipment/home/view/shipment_view.dart';
import 'package:flutter_vss/feature/splash/view/splash_view.dart';
import 'package:flutter_vss/product/service/model/order/order.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: OrderRoute.page),
        AutoRoute(page: OrderDetailRoute.page),
        AutoRoute(page: WayyBillRoute.page),
        AutoRoute(page: SettingsRoute.page),
        AutoRoute(page: CheckOrdersRoute.page),
      ];
}
