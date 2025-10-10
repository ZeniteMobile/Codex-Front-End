import 'dart:ui';
import 'package:codex/components/custom_bottom_app_bar.dart';
import 'package:flutter/material.dart';

class ScaffoldWithSlivers extends StatelessWidget {
  final Widget body;
  final String title;
  final String? currentRoute;
  final bool showBackButton;

  const ScaffoldWithSlivers({
    super.key,
    required this.body,
    required this.title,
    this.currentRoute,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar.medium(
            pinned: true,
            expandedHeight: 120,
            elevation: 0,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            leading: showBackButton
                ? IconButton(
                    icon: const Icon(Icons.chevron_left),
                    color: Colors.black,
                    onPressed: () => Navigator.of(context).pop(),
                  )
                : null,
            flexibleSpace: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: Container(
                  color: Colors.white.withValues(alpha: 0.5),
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(
                      title,
                      style: const TextStyle(
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
          SliverToBoxAdapter(child: body),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.indigo,
        shape: const CircleBorder(),
        child: const Icon(Icons.person_2_outlined, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomAppBar(
        currentRoute: currentRoute ?? ModalRoute.of(context)?.settings.name,
      ),
    );
  }
}
