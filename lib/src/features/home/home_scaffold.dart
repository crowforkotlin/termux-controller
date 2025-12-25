import 'package:flutter/material.dart';
import 'package:flutter_app/src/core/extensions/context_ext.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScaffold extends ConsumerWidget {

  final StatefulNavigationShell navigationShell;

  const HomeScaffold({
    super.key,
      required this.navigationShell
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) => navigationShell.goBranch(index),
        destinations: [
          NavigationDestination(icon: Icon(Icons.terminal), label: context.loc.console),
          NavigationDestination(icon: Icon(Icons.settings), label: context.loc.setting),
        ],
      ),
    );
  }
}
