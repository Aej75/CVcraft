import 'package:auto_route/annotations.dart';
import 'package:cv_app/features/dashboard/presentation/pages/homepage.dart';
import 'package:cv_app/features/onboarding/presentation/pages/onboarding.dart';

import '../../features/dashboard/presentation/pages/forms/personal_details.dart';
import '../../features/dashboard/presentation/pages/forms/resume_objectives.dart';

@AdaptiveAutoRouter(preferRelativeImports: true, routes: [
  AdaptiveRoute(page: OnboardingPage, initial: true),
  AdaptiveRoute(page: HomePage),
  AdaptiveRoute(page: EditTempletPage),
  AdaptiveRoute(page: ResumeObjective)
])
class $AppRouter {}
