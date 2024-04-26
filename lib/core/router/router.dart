import 'package:flutter_showcase_2/presentation/pages/home_page.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/pages/onboarding.dart';
import '../../presentation/pages/signuppage.dart';
import 'routs.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: AppRouts.home,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: AppRouts.signup,
      builder: (context, state) => const SingupPage(),
    ),
    GoRoute(
      path: AppRouts.onboarding,
      builder: (context, state) => const OnboardingPage(),
    )
  ],
);
