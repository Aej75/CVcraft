// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../../features/dashboard/presentation/pages/edit_templet_page.dart'
    as _i3;
import '../../features/dashboard/presentation/pages/homepage.dart' as _i2;
import '../../features/onboarding/presentation/pages/onboarding.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    OnboardingPageRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.OnboardingPage(),
        opaque: true,
      );
    },
    HomePageRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
        opaque: true,
      );
    },
    EditTempletPageRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.EditTempletPage(),
        opaque: true,
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          OnboardingPageRoute.name,
          path: '/',
        ),
        _i4.RouteConfig(
          HomePageRoute.name,
          path: '/home-page',
        ),
        _i4.RouteConfig(
          EditTempletPageRoute.name,
          path: '/edit-templet-page',
        ),
      ];
}

/// generated route for
/// [_i1.OnboardingPage]
class OnboardingPageRoute extends _i4.PageRouteInfo<void> {
  const OnboardingPageRoute()
      : super(
          OnboardingPageRoute.name,
          path: '/',
        );

  static const String name = 'OnboardingPageRoute';
}

/// generated route for
/// [_i2.HomePage]
class HomePageRoute extends _i4.PageRouteInfo<void> {
  const HomePageRoute()
      : super(
          HomePageRoute.name,
          path: '/home-page',
        );

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [_i3.EditTempletPage]
class EditTempletPageRoute extends _i4.PageRouteInfo<void> {
  const EditTempletPageRoute()
      : super(
          EditTempletPageRoute.name,
          path: '/edit-templet-page',
        );

  static const String name = 'EditTempletPageRoute';
}
