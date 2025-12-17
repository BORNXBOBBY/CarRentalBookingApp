import 'package:go_router/go_router.dart';
import '../screens/splash_screen.dart';
import '../screens/onboard_screen.dart';
import '../screens/login_screen.dart';
import 'app_pages.dart';

GoRouter buildRouter(String initialRoute) {
  return GoRouter(
    initialLocation: initialRoute,
    routes: [
      GoRoute(
        path: AppPages.splashPath,
        builder: (_, __) => const SplashScreen(),
      ),
      GoRoute(
        path: AppPages.onboard,
        builder: (_, __) => const OnBoardingScreen(),
      ),
      GoRoute(
        path: AppPages.login,
        builder: (_, __) => LoginScreen(),
      ),
    ],
  );
}
