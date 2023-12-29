import 'package:auto_route/auto_route.dart';
import 'package:flutter_showcase_2/presentation/pages/home_page.dart';
import 'package:flutter_showcase_2/presentation/pages/onboarding/onboarding.dart';
import 'package:flutter_showcase_2/presentation/pages/signuppage.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: OnboardingRoute.page,
          path: '/',
        ),
        AutoRoute(page: HomeRoute.page, path: '/home'),
        AutoRoute(page: SingupRoute.page, path: '/signup'),
      ];
}
