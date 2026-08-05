import 'package:go_router/go_router.dart';
import 'package:marketi/core/constants/route_constants.dart';
import 'package:marketi/features/onboarding/presentation/screen/onboarding_screen.dart';
import 'package:marketi/features/splash/splash_logic.dart';

class AppRoute {
  static final router = GoRouter(
    initialLocation: RouteConstants.splash,
    routes: [
      // splash
      GoRoute(
        path: RouteConstants.splash,
        builder: (context, state) => SplashLogic(),
      ),
      // onboarding
      GoRoute(
        path: RouteConstants.onBoarding,
        builder: (context, state) => OnboardingScreen(),
      ),
    ],
  );
}
