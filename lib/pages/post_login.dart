import 'dart:ui';

import 'package:codex/widgets/form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PostLoginPage extends StatefulWidget {
  const PostLoginPage({super.key});

  @override
  State<PostLoginPage> createState() => _PostLoginPageState();
}

class _PostLoginPageState extends State<PostLoginPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _apiKeyController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    _loadFromDatabase();
  }

  Future<void> _loadFromDatabase() async {
    // Substitua por chamada real ao banco/serviço
    await Future.delayed(const Duration(milliseconds: 300));
    setState(() {
      _nameController.text = 'Usuário Exemplo';
      _emailController.text = 'usuario@exemplo.com';
      _passwordController.text = 'minhaSenhaSegura123';
      _apiKeyController.text = 'AlzaSyDaGmWK4aJsXZ...'; 
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _apiKeyController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _copyApiKey() {
    Clipboard.setData(ClipboardData(text: _apiKeyController.text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Chave API copiada')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar.medium(
              pinned: true,
              expandedHeight: 200,
              // Requires: import 'dart:ui';
              elevation: 0,
              backgroundColor: Colors.transparent,
              flexibleSpace: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                  child: Container(
                    color: Colors.white.withValues(alpha: 0.5),
                    padding: const EdgeInsets.all(16),
                    alignment: Alignment.bottomLeft,
                    child: const Text(
                      'Informações da sua API',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: true,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/post-login.png',
                      height: 120,
                      errorBuilder: (_, __, ___) => const FlutterLogo(size: 100),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Aqui estão as informações da sua API',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      'Você pode mudar suas informações de API nas configurações.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          FormTextField(
                            controller: _nameController,
                            label: 'Nome',
                            hint: '{nome}',
                            icon: Icons.person_outline,
                            obscureText: false,
                            readOnly: true,
                          ),
                          const SizedBox(height: 16),
                          FormTextField(
                            controller: _emailController,
                            label: 'Email',
                            hint: '{email}',
                            icon: Icons.email_outlined,
                            obscureText: false,
                            keyboardType: TextInputType.emailAddress,
                            readOnly: true,
                          ),
                          const SizedBox(height: 16),
                          FormTextField(
                            controller: _passwordController,
                            label: 'Senha',
                            hint: 'Senha',
                            icon: Icons.lock_outline,
                            obscureText: _obscurePassword,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword ? Icons.visibility_off : Icons.visibility,
                              ),
                              onPressed: _togglePasswordVisibility,
                            ),
                            readOnly: true,
                          ),
                          const SizedBox(height: 16),
                          FormTextField(
                            controller: _apiKeyController,
                            label: 'Chave API',
                            hint: 'Sua chave API',
                            icon: Icons.vpn_key,
                            obscureText: false,
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.copy),
                              onPressed: _copyApiKey,
                            ),
                            readOnly: true,
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                // botão apenas exibe/guarda, sem editar campos
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF4069A3),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                'Salvar e Entrar',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
