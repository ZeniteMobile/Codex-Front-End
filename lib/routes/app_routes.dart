import 'package:codex/pages/about_page.dart';
import 'package:codex/pages/dashboard.dart';
import 'package:codex/pages/forgot_password.dart';
import 'package:codex/pages/help.dart';
import 'package:codex/pages/login.dart';
import 'package:codex/pages/post_login.dart';
import 'package:codex/pages/sing-up.dart';
import 'package:codex/pages/settings_page.dart';
import 'package:codex/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgot = '/forgot';
  static const String postLogin = '/post-login';
  static const String settings = '/settings';
  static const String about = '/about';
  static const String dashboard = '/dashboard';
  static const String help = '/help';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case AppRoutes.register:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case AppRoutes.forgot:
        return MaterialPageRoute(
          builder: (_) =>
              ForgotPasswordPage(initialEmail: settings.arguments as String?),
        );
      case AppRoutes.postLogin:
        return MaterialPageRoute(builder: (_) => const PostLoginPage());
      case AppRoutes.settings:
        return MaterialPageRoute(builder: (_) => const SettingsPage());
      case AppRoutes.about:
        return MaterialPageRoute(builder: (_) => const AboutPage());
      case AppRoutes.dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardPage());
      case AppRoutes.help:
        return MaterialPageRoute(builder: (_) => const HelpPage());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(title: const Text('Erro')),
            body: const Center(child: Text('Página não encontrada')),
          ),
        );
    }
  }
}
