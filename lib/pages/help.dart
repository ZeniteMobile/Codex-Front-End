import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Ajuda',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Ação para o menu
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
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
          _buildBottomBar(),
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

  Widget _buildBottomBar() {
    return Positioned(
      bottom: 20,
      left: 20,
      right: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.home_outlined),
                  onPressed: () {},
                ),
                const SizedBox(width: 8),
                IconButton(icon: const Icon(Icons.wifi), onPressed: () {}),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.5),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.shield_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.person_outline),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.blue[700],
            child: const Icon(Icons.settings, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
