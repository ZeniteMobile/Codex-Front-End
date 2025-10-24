import 'package:codex/routes/app_routes.dart';
import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  final String? currentRoute;

  const CustomBottomAppBar({super.key, this.currentRoute});

  @override
  Widget build(BuildContext context) {
    final route = currentRoute ?? ModalRoute.of(context)?.settings.name;

    Color getIconColor(String buttonRoute) {
      return route == buttonRoute ? Colors.indigoAccent : Colors.grey;
    }

    void navigateTo(String targetRoute) {
      if (route != targetRoute) {
        Navigator.pushNamedAndRemoveUntil(context, targetRoute, (_) => false);
      }
    }

    return BottomAppBar(
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
              color: getIconColor(AppRoutes.dashboard),
              onPressed: () => navigateTo(AppRoutes.dashboard),
            ),
            IconButton(
              icon: const Icon(Icons.wifi),
              color: getIconColor(''),
              onPressed: () {},
            ),
            const SizedBox(width: 40),
            IconButton(
              icon: const Icon(Icons.help_outline_rounded),
              color: getIconColor(AppRoutes.help),
              onPressed: () => navigateTo(AppRoutes.help),
            ),
            IconButton(
              icon: const Icon(Icons.settings_outlined),
              color: getIconColor(AppRoutes.settings),
              onPressed: () => navigateTo(AppRoutes.settings),
            ),
          ],
        ),
      ),
    );
  }
}
