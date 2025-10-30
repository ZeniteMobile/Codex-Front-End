import 'package:flutter/material.dart';
import 'package:codex/routes/app_routes.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _AnimatedToast extends StatefulWidget {
  final String message;
  final bool success;

  const _AnimatedToast({Key? key, required this.message, this.success = true}) : super(key: key);

  @override
  State<_AnimatedToast> createState() => _AnimatedToastState();
}

class _AnimatedToastState extends State<_AnimatedToast> with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _opacity;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 360));
    _opacity = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    _slide = Tween<Offset>(begin: const Offset(0, -0.1), end: Offset.zero).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));
    _ctrl.forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slide,
      child: FadeTransition(
        opacity: _opacity,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: widget.success ? Colors.green.shade700 : Colors.red.shade700,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0,4))],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(widget.success ? Icons.check_circle_outline : Icons.error_outline, color: Colors.white),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    widget.message,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<http.Response> _login(String email, String password) {
  return http.post(
    Uri.parse('http://localhost:3000/auth'),
    body: {'email': email, 'senha': password},
  );
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscure = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  

  Future<void> _showAnimatedMessage({
    required String message,
    bool success = true,
    Duration duration = const Duration(milliseconds: 1600),
  }) async {
    if (!mounted) return;

  final overlay = Overlay.of(context);

    final entry = OverlayEntry(builder: (context) {
      return Positioned(
        top: 80,
        left: 24,
        right: 24,
        child: _AnimatedToast(
          message: message,
          success: success,
        ),
      );
    });

    overlay.insert(entry);
    await Future.delayed(duration);
    entry.remove();
  }

  

  @override
  Widget build(BuildContext context) {
    final primary = const Color(0xFF4069A3);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.settings);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 250,
                  child: Image.asset(
                    'assets/login-image-wellcome.png',
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => const FlutterLogo(size: 140),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Crie sua conta',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Ou entre com seu e-mail',
                  style: TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 18),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'E-mail',
                          hintText: 'example@email.com',
                          prefixIcon: const Icon(Icons.person),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: primary),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: primary, width: 2),
                          ),
                        ),
                        validator: (v) {
                          if (v == null || v.isEmpty) return 'Informe o e‑mail';
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(v)) {
                            return 'E‑mail inválido';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _obscure,
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () =>
                                setState(() => _obscure = !_obscure),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: primary),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: primary, width: 2),
                          ),
                        ),
                        validator: (v) {
                          if (v == null || v.isEmpty) return 'Informe a senha';
                          if (v.length < 6) {
                            return 'Senha deve ter ao menos 6 caracteres';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 18),
                        SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () async {
                          if (!(_formKey.currentState?.validate() ?? false)) return;

                          // mostra diálogo de carregamento
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (_) => const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                            ),
                          );

                          try {
                            final response = await _login(
                            _emailController.text,
                            _passwordController.text,
                            );

                            // fecha o diálogo de carregamento
                            if (mounted) Navigator.of(context, rootNavigator: true).pop();

                            if (response.statusCode == 201) {
                              await _showAnimatedMessage(message: response.body, success: true);
                              if (mounted) {
                                Navigator.pushNamedAndRemoveUntil(context, AppRoutes.dashboard, (route) => false);
                              }
                            } else if (response.statusCode == 401) {
                              await _showAnimatedMessage(message: 'E-mail ou senha inválidos', success: false);
                            } else {
                              await _showAnimatedMessage(message: 'Erro: ${response.statusCode} ${response.reasonPhrase}', success: false);
                            }
                          } catch (error) {
                            if (mounted) Navigator.of(context, rootNavigator: true).pop();
                            await _showAnimatedMessage(message: 'Erro: $error', success: false);
                          }
                          },
                          style: ElevatedButton.styleFrom(
                          backgroundColor: primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          ),
                          child: const Text(
                          'Entrar',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {
                            // Navega para a tela de cadastro usando a rota nomeada
                            Navigator.pushNamed(context, AppRoutes.register);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade300,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: const Text(
                            'Cadastre-se',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextButton(
                        onPressed: () {
                          final emailArg = _emailController.text.trim().isEmpty
                              ? null
                              : _emailController.text.trim();
                          Navigator.pushNamed(
                            context,
                            AppRoutes.forgot,
                            arguments: emailArg,
                          );
                        },
                        child: const Text('Esqueci minha senha'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
