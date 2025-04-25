import 'package:go_router/go_router.dart';
import 'package:pruevas_widget/presentation/auth/login/homescreen.dart';
import 'package:pruevas_widget/presentation/page/register/page_login.dart';
import 'package:pruevas_widget/presentation/page/register/page_login_registre.dart';
import 'package:pruevas_widget/presentation/page/register/splash_screen.dart';

class AppRouter {
  static const String splash = '/';
  static const String home = '/home';
  static const String login = '/login';
  static const String register = '/register';

  static final GoRouter router = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(
        path: splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: login,
        builder: (context, state) => PageLogin(),
      ),
      GoRoute(
        path: home,
        builder: (context, state) => const Homescreen(),
      ),
      GoRoute(
        path: register,
        builder: (context, state) => const PageLoginRegistre(),
      ),
    ],
  );
}
