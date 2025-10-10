import 'package:codex/components/scaffold_with_slivers.dart';
import 'package:codex/routes/app_routes.dart';
import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithSlivers(
      title: 'Ajuda',
      showBackButton: false,
      currentRoute: AppRoutes.help,
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(
              16.0,
              16.0,
              16.0,
              120.0,
            ), // Espaço para a barra inferior
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(
                  child: Icon(
                    Icons.shield_outlined, // Placeholder para o logo
                    size: 120,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 32),
                _buildHelpTile('Quantos acessos eu tenho?'),
                _buildHelpTile('Qual o significado dos status?'),
                _buildHelpTile('Como testar minha API?'),
                _buildHelpTile('Como alterar meus dados?'),
                _buildHelpTile('Qual o tempo médio de resposta...'),
                const SizedBox(height: 32),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.support_agent),
                    label: const Text('Ajuda'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHelpTile(String question) {
    return Card(
      elevation: 0,
      color: Colors.grey[200],
      margin: const EdgeInsets.symmetric(vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        title: Text(
          question,
          style: const TextStyle(fontSize: 14, color: Colors.black87),
        ),
        iconColor: Colors.black54,
        collapsedIconColor: Colors.black54,
        tilePadding: const EdgeInsets.symmetric(horizontal: 16.0),
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Aqui vai a resposta para a pergunta. Este é um texto de exemplo para preencher o espaço.',
              style: TextStyle(color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
