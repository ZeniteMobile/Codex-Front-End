import 'package:codex/routes/app_routes.dart';
import 'package:flutter/material.dart';

enum StatusFilter { status, emProcessamento, meusPedidos }

class StatusPage extends StatefulWidget {
  const StatusPage({super.key});

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  StatusFilter _selectedFilter = StatusFilter.status;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Status',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.settings);
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
              100.0,
            ), // Espaço para a barra inferior
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SegmentedButton<StatusFilter>(
                  segments: const [
                    ButtonSegment(
                      value: StatusFilter.status,
                      label: Text('Status'),
                    ),
                    ButtonSegment(
                      value: StatusFilter.emProcessamento,
                      label: Text('Em processamento'),
                    ),
                    ButtonSegment(
                      value: StatusFilter.meusPedidos,
                      label: Text('Meus pedidos'),
                    ),
                  ],
                  selected: {_selectedFilter},
                  onSelectionChanged: (Set<StatusFilter> newSelection) {
                    setState(() {
                      _selectedFilter = newSelection.first;
                    });
                  },
                  style: SegmentedButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    foregroundColor: Colors.grey[600],
                    selectedBackgroundColor: Colors.blue[700],
                    selectedForegroundColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),
                _buildStatusItem(Colors.green, 'Funcionamento'),
                const SizedBox(height: 16),
                _buildStatusItem(Colors.amber, 'Tempo de resposta'),
                const SizedBox(height: 16),
                _buildStatusItem(Colors.green, 'Carga'),
                const SizedBox(height: 24),
                _buildLogsSection(),
              ],
            ),
          ),
          _buildBottomBar(),
        ],
      ),
    );
  }

  Widget _buildStatusItem(Color color, String title) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 12),
        Text(title, style: const TextStyle(fontSize: 16)),
      ],
    );
  }

  Widget _buildLogsSection() {
    const logData = '''
{
  "timestamp": "2025-09-14T18:32:45Z",
  "service": "api-contratos",
  "status": "ONLINE",
  "http_status": 200,
  "endpoint": "/v1/validacao",
  "method": "POST",
  "response_time_ms": 256,
  "idJob": 775
}''';

    return ExpansionTile(
      title: const Text('Ver Logs'),
      tilePadding: EdgeInsets.zero,
      childrenPadding: const EdgeInsets.only(top: 8),
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF2E2E2E),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            logData,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'monospace',
              fontSize: 14,
            ),
          ),
        ),
      ],
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
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.redAccent.withOpacity(0.5),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: const Icon(Icons.wifi, color: Colors.white),
                ),
                const SizedBox(width: 8),
                IconButton(icon: const Icon(Icons.history), onPressed: () {}),
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
