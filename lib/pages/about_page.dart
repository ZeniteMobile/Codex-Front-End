import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.green[800],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    // Placeholder for the logo
                    child: const Icon(
                      Icons.code,
                      color: Colors.white,
                      size: 80,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Desenvolvido pela Zênite-Digital',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Equipe',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildTeamMember(
              name: 'Arthur Hydeki Ricken',
              role: 'Desenvolvedor',
              imageAsset: 'assets/profile-pics/1.png',
            ),
            _buildTeamMember(
              name: 'Eduardo B. Garcia',
              role: 'Desenvolvedor',
              imageAsset: 'assets/profile-pics/2.png',
            ),
            _buildTeamMember(
              name: 'Rafael L. B. Ouverney',
              role: 'Desenvolvedor',
              imageAsset: 'assets/profile-pics/3.png',
            ),
            _buildTeamMember(
              name: 'Vitor B. Garcia',
              role: 'Desenvolvedor',
              imageAsset: 'assets/profile-pics/4.png',
            ),
            const SizedBox(height: 24),
            const Text(
              'Licenças',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildLicenseItem(
              title: 'Imagens de Perfil',
              subtitle: 'Imagem por pikisuperstar, Freepik',
              icon: Icons.collections,
            ),
            const SizedBox(height: 24),
            const Text(
              'IFPR',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildLicenseItem(
              title: 'Desenvolvido no IFPR',
              subtitle:
                  'Parte de projeto na disciplina de Desenvolvimento para Dispositivos Móveis',
              icon: Icons.school,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamMember({
    required String name,
    required String role,
    required String imageAsset,
  }) {
    return Card(
      elevation: 0,
      color: Colors.purple.withOpacity(0.05),
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: CircleAvatar(backgroundImage: AssetImage(imageAsset)),
        title: Text(name),
        subtitle: Text(role),
      ),
    );
  }

  Widget _buildLicenseItem({
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    return Card(
      elevation: 0,
      color: Colors.purple.withOpacity(0.05),
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: Colors.green[800]),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
