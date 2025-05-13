import 'package:flutter/material.dart';
import 'package:pretium_test/ui/auth/forgot_password_screen.dart';
import 'package:pretium_test/ui/auth/login_screen.dart';
import 'package:pretium_test/ui/auth/register_screen.dart';
import 'package:pretium_test/ui/home/home_screen.dart';
import 'package:pretium_test/ui/splash_screen.dart';

class _Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouter.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRouter.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case AppRouter.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case AppRouter.forgotPassword:
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
      case AppRouter.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder:
          (_) => Scaffold(
            appBar: AppBar(title: const Text("Error")),
            body: const Center(child: Text("No route found")),
          ),
    );
  }
}

class AppRouter {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String home = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    return _Router.generateRoute(settings);
  }
}
