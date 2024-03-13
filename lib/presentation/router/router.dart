import 'package:flutter_showcase_2/presentation/pages/home_page.dart';
import 'package:go_router/go_router.dart';

import '../pages/onboarding/onboarding.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingPage(),
    )
  ],
);
