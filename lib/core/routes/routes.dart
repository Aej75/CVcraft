import 'package:auto_route/annotations.dart';
import 'package:cv_app/features/dashboard/presentation/pages/homepage.dart';
import 'package:cv_app/features/onboarding/presentation/pages/onboarding.dart';

import '../../features/dashboard/presentation/pages/edit_templet_page.dart';

@AdaptiveAutoRouter(preferRelativeImports: true, routes: [
  AdaptiveRoute(page: OnboardingPage, initial: true),
  AdaptiveRoute(page: HomePage),
  AdaptiveRoute(page: EditTempletPage),
])
class $AppRouter {}
