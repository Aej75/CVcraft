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
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../../features/dashboard/presentation/pages/forms/experience.dart'
    as _i6;
import '../../features/dashboard/presentation/pages/forms/personal_details.dart'
    as _i3;
import '../../features/dashboard/presentation/pages/forms/resume_objectives.dart'
    as _i4;
import '../../features/dashboard/presentation/pages/forms/skills.dart' as _i5;
import '../../features/dashboard/presentation/pages/homepage.dart' as _i2;
import '../../features/onboarding/presentation/pages/onboarding.dart' as _i1;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    OnboardingPageRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.OnboardingPage(),
        opaque: true,
      );
    },
    HomePageRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
        opaque: true,
      );
    },
    EditTempletPageRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.EditTempletPage(),
        opaque: true,
      );
    },
    ResumeObjectiveRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.ResumeObjective(),
        opaque: true,
      );
    },
    SkillsRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.Skills(),
        opaque: true,
      );
    },
    ExperiencePageRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.ExperiencePage(),
        opaque: true,
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          OnboardingPageRoute.name,
          path: '/',
        ),
        _i7.RouteConfig(
          HomePageRoute.name,
          path: '/home-page',
        ),
        _i7.RouteConfig(
          EditTempletPageRoute.name,
          path: '/edit-templet-page',
        ),
        _i7.RouteConfig(
          ResumeObjectiveRoute.name,
          path: '/resume-objective',
        ),
        _i7.RouteConfig(
          SkillsRoute.name,
          path: '/Skills',
        ),
        _i7.RouteConfig(
          ExperiencePageRoute.name,
          path: '/experience-page',
        ),
      ];
}

/// generated route for
/// [_i1.OnboardingPage]
class OnboardingPageRoute extends _i7.PageRouteInfo<void> {
  const OnboardingPageRoute()
      : super(
          OnboardingPageRoute.name,
          path: '/',
        );

  static const String name = 'OnboardingPageRoute';
}

/// generated route for
/// [_i2.HomePage]
class HomePageRoute extends _i7.PageRouteInfo<void> {
  const HomePageRoute()
      : super(
          HomePageRoute.name,
          path: '/home-page',
        );

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [_i3.EditTempletPage]
class EditTempletPageRoute extends _i7.PageRouteInfo<void> {
  const EditTempletPageRoute()
      : super(
          EditTempletPageRoute.name,
          path: '/edit-templet-page',
        );

  static const String name = 'EditTempletPageRoute';
}

/// generated route for
/// [_i4.ResumeObjective]
class ResumeObjectiveRoute extends _i7.PageRouteInfo<void> {
  const ResumeObjectiveRoute()
      : super(
          ResumeObjectiveRoute.name,
          path: '/resume-objective',
        );

  static const String name = 'ResumeObjectiveRoute';
}

/// generated route for
/// [_i5.Skills]
class SkillsRoute extends _i7.PageRouteInfo<void> {
  const SkillsRoute()
      : super(
          SkillsRoute.name,
          path: '/Skills',
        );

  static const String name = 'SkillsRoute';
}

/// generated route for
/// [_i6.ExperiencePage]
class ExperiencePageRoute extends _i7.PageRouteInfo<void> {
  const ExperiencePageRoute()
      : super(
          ExperiencePageRoute.name,
          path: '/experience-page',
        );

  static const String name = 'ExperiencePageRoute';
}
