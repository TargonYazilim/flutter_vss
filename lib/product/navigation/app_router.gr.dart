// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CheckOrdersRoute.name: (routeData) {
      final args = routeData.argsAs<CheckOrdersRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CheckOrdersView(
          order: args.order,
          key: args.key,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginView(),
      );
    },
    OrderDetailRoute.name: (routeData) {
      final args = routeData.argsAs<OrderDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OrderDetailView(
          order: args.order,
          key: args.key,
        ),
      );
    },
    OrderRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OrderView(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsView(),
      );
    },
    ShipmentRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ShipmentView(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashView(),
      );
    },
    WayyBillRoute.name: (routeData) {
      final args = routeData.argsAs<WayyBillRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WayyBillView(
          order: args.order,
          key: args.key,
        ),
      );
    },
  };
}

/// generated route for
/// [CheckOrdersView]
class CheckOrdersRoute extends PageRouteInfo<CheckOrdersRouteArgs> {
  CheckOrdersRoute({
    required Order order,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CheckOrdersRoute.name,
          args: CheckOrdersRouteArgs(
            order: order,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CheckOrdersRoute';

  static const PageInfo<CheckOrdersRouteArgs> page =
      PageInfo<CheckOrdersRouteArgs>(name);
}

class CheckOrdersRouteArgs {
  const CheckOrdersRouteArgs({
    required this.order,
    this.key,
  });

  final Order order;

  final Key? key;

  @override
  String toString() {
    return 'CheckOrdersRouteArgs{order: $order, key: $key}';
  }
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginView]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OrderDetailView]
class OrderDetailRoute extends PageRouteInfo<OrderDetailRouteArgs> {
  OrderDetailRoute({
    required Order order,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          OrderDetailRoute.name,
          args: OrderDetailRouteArgs(
            order: order,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'OrderDetailRoute';

  static const PageInfo<OrderDetailRouteArgs> page =
      PageInfo<OrderDetailRouteArgs>(name);
}

class OrderDetailRouteArgs {
  const OrderDetailRouteArgs({
    required this.order,
    this.key,
  });

  final Order order;

  final Key? key;

  @override
  String toString() {
    return 'OrderDetailRouteArgs{order: $order, key: $key}';
  }
}

/// generated route for
/// [OrderView]
class OrderRoute extends PageRouteInfo<void> {
  const OrderRoute({List<PageRouteInfo>? children})
      : super(
          OrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsView]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ShipmentView]
class ShipmentRoute extends PageRouteInfo<void> {
  const ShipmentRoute({List<PageRouteInfo>? children})
      : super(
          ShipmentRoute.name,
          initialChildren: children,
        );

  static const String name = 'ShipmentRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashView]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WayyBillView]
class WayyBillRoute extends PageRouteInfo<WayyBillRouteArgs> {
  WayyBillRoute({
    required Order order,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          WayyBillRoute.name,
          args: WayyBillRouteArgs(
            order: order,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'WayyBillRoute';

  static const PageInfo<WayyBillRouteArgs> page =
      PageInfo<WayyBillRouteArgs>(name);
}

class WayyBillRouteArgs {
  const WayyBillRouteArgs({
    required this.order,
    this.key,
  });

  final Order order;

  final Key? key;

  @override
  String toString() {
    return 'WayyBillRouteArgs{order: $order, key: $key}';
  }
}
