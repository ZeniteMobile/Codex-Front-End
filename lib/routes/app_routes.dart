import 'package:codex/pages/forgot_password.dart';
import 'package:codex/pages/login.dart';
import 'package:codex/pages/post_login.dart';
import 'package:codex/pages/sing-up.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String login = '/';
  static const String register = '/register';
  static const String forgot = '/forgot'; 
  static const String postLogin = '/post-login';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case AppRoutes.register:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case AppRoutes.forgot:
        return MaterialPageRoute(
          builder: (_) => ForgotPasswordPage(initialEmail: settings.arguments as String?),
        );
      case AppRoutes.postLogin:
        return MaterialPageRoute(builder: (_) => const PostLoginPage());
        

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