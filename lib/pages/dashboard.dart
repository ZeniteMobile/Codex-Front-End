import 'dart:math' as math;
import 'dart:ui';
import 'package:codex/components/scaffold_with_slivers.dart';
import 'package:codex/routes/app_routes.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithSlivers(
      title: 'Dashboard',
      showBackButton: false,
      currentRoute: AppRoutes.dashboard,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 270,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // calcula espaço disponível para as barras com folga para títulos/paddings
                  final availableHeight = constraints.maxHeight;
                  final reservedForTextsAndPadding =
                      72.0; // estimativa: título + espaçamentos + legenda
                  final dynamicMaxBarHeight = math.max(
                    60.0,
                    availableHeight - reservedForTextsAndPadding,
                  );

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
                      final maxBarHeight = dynamicMaxBarHeight.clamp(
                        60.0,
                        140.0,
                      );

                      return Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Uso da API',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              SizedBox(
                                height:
                                    maxBarHeight +
                                    28, // espaço adicional para labels
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    for (var i = 0; i < data.length; i++) ...[
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 4,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                height: maxVal > 0
                                                    ? ((data[i] / maxVal) *
                                                          maxBarHeight)
                                                    : 0,
                                                decoration: BoxDecoration(
                                                  color: i == data.length - 1
                                                      ? Colors.indigo
                                                      : Colors.indigoAccent,
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                data[i].toStringAsFixed(0),
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                ),
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
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
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
          ],
        ),
      ),
    );
  }
}
