import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.indigo,
        shape: const CircleBorder(),
        child: const Icon(Icons.person_2_outlined, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[300],
        elevation: 8,
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.home),
                color: Colors.indigoAccent,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.wifi),
                color: Colors.grey,
                onPressed: () {},
              ),
              const SizedBox(width: 40), 
              IconButton(
                icon: const Icon(Icons.help_outline),
                color: Colors.grey,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.settings_outlined ),
                color: Colors.grey,
                onPressed: () {
                  Navigator.pushNamed(context, '/settings');
                },
              ),
            ],
          ),
        ),
      ),
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
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: const Text(
                      'Dashboard',
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
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    child: SizedBox(
                      height: 270,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          // calcula espaço disponível para as barras com folga para títulos/paddings
                          final availableHeight = constraints.maxHeight;
                          final reservedForTextsAndPadding = 72.0; // estimativa: título + espaçamentos + legenda
                          final dynamicMaxBarHeight = math.max(60.0, availableHeight - reservedForTextsAndPadding);

                          return FutureBuilder<List<double>>(
                            future: Future.delayed(
                              const Duration(milliseconds: 500),
                              () => <double>[10, 30, 20, 60, 45],
                            ),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return const Center(child: CircularProgressIndicator());
                              }
                              final data = snapshot.data ?? <double>[];
                              if (data.isEmpty) {
                                return const Center(child: Text('Sem dados de uso'));
                              }
                              final maxVal = data.reduce((a, b) => a > b ? a : b);
                              final maxBarHeight = dynamicMaxBarHeight.clamp(60.0, 140.0);

                              return Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text('Uso da API', style: TextStyle(fontWeight: FontWeight.bold)),
                                      const SizedBox(height: 8),
                                      SizedBox(
                                        height: maxBarHeight + 28, // espaço adicional para labels
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            for (var i = 0; i < data.length; i++) ...[
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 4),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      Container(
                                                        height: maxVal > 0 ? ((data[i] / maxVal) * maxBarHeight) : 0,
                                                        decoration: BoxDecoration(
                                                          color: i == data.length - 1 ? Colors.indigo : Colors.indigoAccent,
                                                          borderRadius: BorderRadius.circular(6),
                                                        ),
                                                      ),
                                                      const SizedBox(height: 8),
                                                      Text(
                                                        data[i].toStringAsFixed(0),
                                                        style: const TextStyle(fontSize: 12),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'Últimos ${data.length} registros',
                                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
