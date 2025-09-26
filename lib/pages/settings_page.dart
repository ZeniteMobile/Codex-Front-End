import 'dart:ui';
import 'package:codex/routes/app_routes.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar.medium(
            pinned: true,
            expandedHeight: 200,
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(Icons.chevron_left),
              color: Colors.black,
              onPressed: () => Navigator.of(context).pop(),
            ),
            flexibleSpace: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: Container(
                  color: Colors.white.withOpacity(0.5),
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
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
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
            ),
          ),
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
