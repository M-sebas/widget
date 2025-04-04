import 'package:go_router/go_router.dart';
import 'package:pruevas_widget/presentation/auth/login/homescreen.dart';
import 'package:pruevas_widget/presentation/register/page_login.dart';
import 'package:pruevas_widget/presentation/register/page_login_registre.dart';
import 'package:pruevas_widget/presentation/router/routes/app_router.dart';



class AppRoute {
  static final GoRouter router = GoRouter(
    initialLocation: AppRouter.login,
    routes: [
      GoRoute(path: AppRouter.login, 
      builder: (context, state) => PageLogin()),

      GoRoute(path: AppRouter.register, 
      builder: (context, state) => const PageLoginRegistre()),
      
      GoRoute(path: AppRouter.home, 
      builder: (context, state)=> const Homescreen()),
    ],
  );
}

