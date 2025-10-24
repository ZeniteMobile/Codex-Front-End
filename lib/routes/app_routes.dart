import 'package:codex/pages/about_page.dart';
import 'package:codex/pages/dashboard.dart';
import 'package:codex/pages/forgot_password.dart';
import 'package:codex/pages/help_chat_page.dart';
import 'package:codex/pages/help_page.dart';
import 'package:codex/pages/login.dart';
import 'package:codex/pages/profile_page.dart';
import 'package:codex/pages/sing-up.dart';
import 'package:codex/pages/settings_page.dart';
import 'package:codex/pages/status_page.dart';
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
  static const String status = '/status';
  static const String helpChat = '/help-chat';
  static const String help = '/help';
  static const String profile = '/profile';
  static const String dashboard = '/dashboard';
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
      case AppRoutes.status:
        return MaterialPageRoute(builder: (_) => const StatusPage());
      case AppRoutes.helpChat:
        return MaterialPageRoute(builder: (_) => const HelpChatPage());
      case AppRoutes.help:
        return MaterialPageRoute(builder: (_) => const HelpChatPage());
      case AppRoutes.profile:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      // Rota de erro caso a rota chamada não exista
      case AppRoutes.dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardPage());

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
