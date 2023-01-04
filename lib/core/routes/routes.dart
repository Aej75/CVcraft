import 'package:auto_route/annotations.dart';
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
  AdaptiveRoute(page: EditTempletPage),
  AdaptiveRoute(page: ResumeObjective),
  AdaptiveRoute(page: Skills),
  AdaptiveRoute(page: ExperiencePage),
  AdaptiveRoute(page: EducationPage),
])
class $AppRouter {}
