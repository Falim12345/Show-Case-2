import 'package:auto_route/auto_route.dart';
import 'package:flutter_showcase_2/presentation/pages/home_page.dart';
import 'package:flutter_showcase_2/presentation/pages/onboarding/onboarding1.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  static const String firstRunKey = 'firstRun';

  bool isFirstRun = true;

  AppRouter() {
    checkFirstRun();
  }

  Future<void> checkFirstRun() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Получаем значение флага первого запуска
    bool isFirstRun = prefs.getBool(firstRunKey) ?? true;

    // Обновляем состояние флага
    this.isFirstRun = isFirstRun;

    // Если это первый запуск, отображаем Onboarding и сохраняем флаг
    if (isFirstRun) {
      prefs.setBool(firstRunKey, false);
      notifyListeners(); // Обновляем маршруты после изменения состояния
    }
  }

  @override
  List<AutoRoute> get routes => [
        if (isFirstRun)
          AutoRoute(page: OnboardingRoute.page, path: '/', children: [
            AutoRoute(
              page: HomeRoute.page,
              path: 'home',
            ),
          ]),
        if (!isFirstRun)
          AutoRoute(page: HomeRoute.page, path: '/', children: []),
      ];
}
// AutoRoute(page: OnboardingRoute.page, path: '/', children: [
//           AutoRoute(page: HomeRoute.page), /*...*/
//         ]),
