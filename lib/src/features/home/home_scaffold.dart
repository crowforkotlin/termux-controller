import 'package:flutter/material.dart';
import 'package:flutter_app/src/core/extensions/context_ext.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScaffold extends ConsumerWidget {
  final Widget child; // 这是子路由的内容

  const HomeScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _calculateSelectedIndex(context),
        onDestinationSelected: (index) => _onItemTapped(index, context),
        destinations: [
          NavigationDestination(icon: Icon(Icons.terminal), label: context.loc.console),
          NavigationDestination(icon: Icon(Icons.settings), label: context.loc.setting),
        ],
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/setting')) return 1;
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    context.go(switch (index) {
      0 => '/console',
      1 => '/setting',
      _ => '/console',
    });
  }
}
