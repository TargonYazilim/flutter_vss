import 'package:auto_route/auto_route.dart';
import 'package:flutter_vss/feature/home/view/home_view.dart';
import 'package:flutter_vss/feature/login/view/login_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: HomeRoute.page, initial: true),
      ];
}
