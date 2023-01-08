import 'package:auto_route/auto_route.dart';
import 'package:cv_app/features/dashboard/presentation/pages/forms/education.dart';
import 'package:cv_app/features/dashboard/presentation/pages/forms/skills.dart';
import 'package:cv_app/features/dashboard/presentation/pages/homepage.dart';
import 'package:cv_app/features/onboarding/presentation/pages/onboarding.dart';

import '../../features/dashboard/presentation/pages/forms/experience.dart';
import '../../features/dashboard/presentation/pages/forms/personal_details.dart';
import '../../features/dashboard/presentation/pages/forms/resume_objectives.dart';

@AdaptiveAutoRouter(preferRelativeImports: true, routes: [
  AdaptiveRoute(page: OnboardingPage, initial: true),
  AdaptiveRoute(page: HomePage),

  CustomRoute(
      page: EditTempletPage,
      reverseDurationInMilliseconds: 400,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 400),

  CustomRoute(
      page: EducationPage,
      reverseDurationInMilliseconds: 400,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 400),

  CustomRoute(
      page: ExperiencePage,
      reverseDurationInMilliseconds: 400,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 400),

  CustomRoute(
      page: Skills,
      reverseDurationInMilliseconds: 400,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 400),

  CustomRoute(
      page: ResumeObjective,
      reverseDurationInMilliseconds: 400,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 400),
  // AdaptiveRoute(page: EditTempletPage,),
])
class $AppRouter {}
