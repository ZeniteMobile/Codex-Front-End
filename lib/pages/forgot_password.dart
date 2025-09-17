import 'package:codex/components/notification_dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class ForgotPasswordPage extends StatefulWidget {
  final String? initialEmail;
  const ForgotPasswordPage({super.key, this.initialEmail});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final Color primary = const Color(0xFF4069A3);
  bool _sending = false;

  @override
  void initState() {
    super.initState();
    if (widget.initialEmail != null && widget.initialEmail!.isNotEmpty) {
      _emailController.text = widget.initialEmail!;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Caso a rota tenha passado o e-mail via settings.arguments
    final arg = ModalRoute.of(context)?.settings.arguments;
    if ((arg is String) && arg.isNotEmpty && _emailController.text.isEmpty) {
      _emailController.text = arg;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _sendRecovery() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    setState(() => _sending = true);

    await Future.delayed(const Duration(seconds: 1));
    setState(() => _sending = false);

    // usar o componente reutilizável
    await NotificationDialog.show(
      context,
      title: 'Sucesso',
      message: 'Link de recuperação enviado para ${_emailController.text}',
      type: DialogType.success,
      autoClose: const Duration(seconds: 2), // fecha automaticamente após 2s
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 250,
                  child: Image.asset(
                    'assets/forgot-password-image.png',
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => const FlutterLogo(size: 140),
                  ),
                ),

                const SizedBox(height: 8),
                const Text(
                  'Recuperar senha',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Insira o e-mail associado à sua conta. Enviaremos um link para redefinir sua senha.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 24),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'E-mail',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (v) {
                              if (v == null || v.isEmpty)
                                return 'Informe o e‑mail';
                              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(v))
                                return 'E‑mail inválido';
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'example@email.com',
                              prefixIcon: Icon(
                                Icons.mail_outline,
                                color: Colors.grey.shade600,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 16,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: primary),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: primary),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: primary,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      // Opção A: garantir largura com SizedBox
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: _sending ? null : _sendRecovery,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: _sending
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : const Text(
                                  'Enviar link',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Opção B: usar minimumSize no style (também funciona sem SizedBox)
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade300,
                            foregroundColor: Colors.black87,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            minimumSize: const Size.fromHeight(
                              48,
                            ), // garante altura mínima
                          ),
                          child: const Text(
                            'Voltar',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black54, fontSize: 12),
                    children: [
                      const TextSpan(text: 'Recebeu o e-mail? '),
                      TextSpan(
                        text: 'Tentar novamente',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // lógica para re-disparar o envio se desejar
                          },
                      ),
                    ],
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
