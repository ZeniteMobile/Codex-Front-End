import 'dart:ui';
import 'package:codex/components/scaffold_with_slivers.dart';
import 'package:codex/routes/app_routes.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithSlivers(
      title: "Configurações",
      showBackButton: false,
      currentRoute: AppRoutes.settings,
      body: Column(
        children: [
          const SizedBox(height: 8),
          _buildSettingsItem(
            context,
            icon: Icons.data_object,
            title: 'Dados da API',
            subtitle: 'Configuração da API',
            onTap: () {
              // TODO: Navigate to API settings
            },
          ),
          _buildSettingsItem(
            context,
            icon: Icons.person_outline,
            title: 'Dados do Usuário',
            subtitle:
                'Modificação de dados do usuário como Nome, E-mail e Senha',
            onTap: () {
              // TODO: Navigate to User Data
            },
          ),
          _buildSettingsItem(
            context,
            icon: Icons.pie_chart_outline,
            title: 'Visualização',
            subtitle: 'Configuração dos gráficos da dashboard',
            onTap: () {
              // TODO: Navigate to Visualization settings
            },
          ),
          _buildSettingsItem(
            context,
            icon: Icons.timer_outlined,
            title: 'Tempo Limite',
            subtitle:
                'Configuração do tempo limite de resposta (apenas para visualização)',
            onTap: () {
              // TODO: Navigate to Timeout settings
            },
          ),
          _buildSettingsItem(
            context,
            icon: Icons.info_outline,
            title: 'Sobre',
            subtitle: 'Sobre o Codex, licensas e equipe de desenvolvimento',
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.about);
            },
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.blue.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: Colors.blueAccent),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: onTap,
    );
  }
}
