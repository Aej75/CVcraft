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
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../../features/dashboard/presentation/pages/forms/personal_details.dart'
    as _i3;
import '../../features/dashboard/presentation/pages/forms/resume_objectives.dart'
    as _i4;
import '../../features/dashboard/presentation/pages/homepage.dart' as _i2;
import '../../features/onboarding/presentation/pages/onboarding.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    OnboardingPageRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.OnboardingPage(),
        opaque: true,
      );
    },
    HomePageRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
        opaque: true,
      );
    },
    EditTempletPageRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.EditTempletPage(),
        opaque: true,
      );
    },
    ResumeObjectiveRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.ResumeObjective(),
        opaque: true,
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          OnboardingPageRoute.name,
          path: '/',
        ),
        _i5.RouteConfig(
          HomePageRoute.name,
          path: '/home-page',
        ),
        _i5.RouteConfig(
          EditTempletPageRoute.name,
          path: '/edit-templet-page',
        ),
        _i5.RouteConfig(
          ResumeObjectiveRoute.name,
          path: '/resume-objective',
        ),
      ];
}

/// generated route for
/// [_i1.OnboardingPage]
class OnboardingPageRoute extends _i5.PageRouteInfo<void> {
  const OnboardingPageRoute()
      : super(
          OnboardingPageRoute.name,
          path: '/',
        );

  static const String name = 'OnboardingPageRoute';
}

/// generated route for
/// [_i2.HomePage]
class HomePageRoute extends _i5.PageRouteInfo<void> {
  const HomePageRoute()
      : super(
          HomePageRoute.name,
          path: '/home-page',
        );

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [_i3.EditTempletPage]
class EditTempletPageRoute extends _i5.PageRouteInfo<void> {
  const EditTempletPageRoute()
      : super(
          EditTempletPageRoute.name,
          path: '/edit-templet-page',
        );

  static const String name = 'EditTempletPageRoute';
}

/// generated route for
/// [_i4.ResumeObjective]
class ResumeObjectiveRoute extends _i5.PageRouteInfo<void> {
  const ResumeObjectiveRoute()
      : super(
          ResumeObjectiveRoute.name,
          path: '/resume-objective',
        );

  static const String name = 'ResumeObjectiveRoute';
}
