import 'package:flutter/material.dart';

enum DialogType { success, error, info }

class NotificationDialog extends StatelessWidget {
  final String title;
  final String message;
  final DialogType type;
  final Duration autoCloseDuration;
  final bool showCloseButton;

  const NotificationDialog({
    super.key,
    required this.title,
    required this.message,
    this.type = DialogType.info,
    this.autoCloseDuration = const Duration(seconds: 7),
    this.showCloseButton = true,
  });

  Color get _color {
    switch (type) {
      case DialogType.success:
        return const Color(0xFF4069A3);
      case DialogType.error:
        return Colors.redAccent;
      case DialogType.info:
      default:
        return Colors.blueGrey;
    }
  }

  IconData get _icon {
    switch (type) {
      case DialogType.success:
        return Icons.check_circle_outline;
      case DialogType.error:
        return Icons.error_outline;
      case DialogType.info:
      default:
        return Icons.info_outline;
    }
  }

  static Future<void> show(
    BuildContext context, {
    required String title,
    required String message,
    DialogType type = DialogType.info,
    Duration? autoClose,
    bool barrierDismissible = true,
    bool showCloseButton = true,
  }) async {
    final autoCloseDuration = autoClose ?? Duration.zero;

    // Não await showGeneralDialog aqui — guardamos a Future e agendamos o auto-close em paralelo.
    final dialogFuture = showGeneralDialog(
      context: context,
      barrierLabel: title,
      barrierDismissible: barrierDismissible,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (ctx, anim1, anim2) {
        return Align(
          alignment: Alignment.topCenter,
          child: NotificationDialog(
            title: title,
            message: message,
            type: type,
            autoCloseDuration: autoCloseDuration,
            showCloseButton: showCloseButton,
          ),
        );
      },
      transitionBuilder: (ctx, anim, secAnim, child) {
        final tween = Tween(begin: const Offset(0, -0.07), end: Offset.zero);
        return SlideTransition(
          position: tween.animate(CurvedAnimation(parent: anim, curve: Curves.easeOut)),
          child: FadeTransition(opacity: anim, child: child),
        );
      },
    );

    if (autoCloseDuration > Duration.zero) {
      // agenda o fechamento sem bloquear a exibição do diálogo
      Future.delayed(autoCloseDuration, () {
        try {
          if (Navigator.of(context).canPop()) Navigator.of(context).pop();
        } catch (_) {
          // ignorar erro se context não for mais válido
        }
      });
    }

    // retorna a Future do diálogo (completa quando o diálogo é fechado)
    await dialogFuture;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.only(top: 120, left: 24, right: 24),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 12)],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(_icon, size: 56, color: _color),
            const SizedBox(height: 12),
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(message, textAlign: TextAlign.center, style: const TextStyle(color: Colors.black54)),
            const SizedBox(height: 12),
            if (showCloseButton)
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    if (Navigator.of(context).canPop()) Navigator.of(context).pop();
                  },
                  child: const Text('Fechar'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}