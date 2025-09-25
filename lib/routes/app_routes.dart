import 'package:codex/pages/about_page.dart';
import 'package:codex/pages/forgot_password.dart';
import 'package:codex/pages/login.dart';
import 'package:codex/pages/sing-up.dart';
import 'package:codex/pages/settings_page.dart';
import 'package:flutter/material.dart';

/// Contém os nomes das rotas como constantes para evitar erros de digitação.
class AppRoutes {
  static const String login = '/';
  static const String register = '/register';
  static const String forgot = '/forgot'; // <--- adicione isto
  static const String settings = '/settings';
  static const String about = '/about';
}

/// Gera as rotas com base no nome fornecido.
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case AppRoutes.register:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case AppRoutes.forgot:
        // arguments pode ser uma String com o e-mail ou null
        return MaterialPageRoute(
          builder:
              (_) => ForgotPasswordPage(
                initialEmail: settings.arguments as String?,
              ),
        );
      case AppRoutes.settings:
        return MaterialPageRoute(builder: (_) => const SettingsPage());
      case AppRoutes.about:
        return MaterialPageRoute(builder: (_) => const AboutPage());

      // Rota de erro caso a rota chamada não exista
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                appBar: AppBar(title: const Text('Erro')),
                body: const Center(child: Text('Página não encontrada')),
              ),
        );
    }
  }
}
