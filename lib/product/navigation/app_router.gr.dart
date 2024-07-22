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
    TransportDetailRoute.name: (routeData) {
      final args = routeData.argsAs<TransportDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TransportDetailView(
          key: args.key,
          sevkiyatModel: args.sevkiyatModel,
        ),
      );
    },
    TransportRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TransportView(),
      );
    },
  };
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
/// [TransportDetailView]
class TransportDetailRoute extends PageRouteInfo<TransportDetailRouteArgs> {
  TransportDetailRoute({
    Key? key,
    required SevkiyatModel sevkiyatModel,
    List<PageRouteInfo>? children,
  }) : super(
          TransportDetailRoute.name,
          args: TransportDetailRouteArgs(
            key: key,
            sevkiyatModel: sevkiyatModel,
          ),
          initialChildren: children,
        );

  static const String name = 'TransportDetailRoute';

  static const PageInfo<TransportDetailRouteArgs> page =
      PageInfo<TransportDetailRouteArgs>(name);
}

class TransportDetailRouteArgs {
  const TransportDetailRouteArgs({
    this.key,
    required this.sevkiyatModel,
  });

  final Key? key;

  final SevkiyatModel sevkiyatModel;

  @override
  String toString() {
    return 'TransportDetailRouteArgs{key: $key, sevkiyatModel: $sevkiyatModel}';
  }
}

/// generated route for
/// [TransportView]
class TransportRoute extends PageRouteInfo<void> {
  const TransportRoute({List<PageRouteInfo>? children})
      : super(
          TransportRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransportRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
