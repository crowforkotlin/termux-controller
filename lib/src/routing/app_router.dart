import 'package:flutter/material.dart';
import 'package:flutter_app/src/features/home/home_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/console/console_page.dart';
import '../features/settings/setting_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/console',
    routes: [
      StatefulShellRoute(
        builder: (context, state, navigationShell) {
          // 返回你定义的 HomeScaffold，并把 shell 传进去
          return HomeScaffold(navigationShell: navigationShell);
        },
        navigatorContainerBuilder: (context, navigationShell, children) {
          return GlobalFadeIndexedStack(
            index: navigationShell.currentIndex,
            children: children,
          );
        },
        branches: [
          // Console 分支
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/console',
                pageBuilder: (context, state) =>
                const NoTransitionPage(
                  child: ConsolePage(),
                ),
              ),
            ],
          ),
          // Setting 分支
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/setting',
                pageBuilder: (context, state) =>
                const NoTransitionPage(
                  child: SettingPage(),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});

class GlobalFadeIndexedStack extends StatelessWidget {
  final int index;
  final List<Widget> children;
  final Duration duration;

  const GlobalFadeIndexedStack({
    super.key,
    required this.index,
    required this.children,
    this.duration = const Duration(milliseconds: 300),
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      // 使用 fit: StackFit.expand 确保子页面撑满屏幕
      fit: StackFit.expand,
      children: children.asMap().entries.map((entry) {
        final i = entry.key;
        final child = entry.value;
        final isSelected = i == index;

        return AnimatedOpacity(
          // 【关键点 1】：必须添加 Key！
          // 这告诉 Flutter：这个 Widget 还是原来那个，只是属性变了，请做动画。
          key: ValueKey(i),

          opacity: isSelected ? 1.0 : 0.0,
          duration: duration,
          curve: Curves.easeInOut,

          // 【关键点 2】：优化性能和交互
          // 这里的 IgnorePointer 放在 AnimatedOpacity 内部或外部都可以，
          // 但为了防止隐藏页面在 fade out 过程中拦截点击，
          // 配合 TickerMode 和 ExcludeFocus 使用更佳。
          child: IgnorePointer(
            ignoring: !isSelected,
            child: TickerMode(
              // 如果页面不可见，停止该页面内部的动画（如 CircularProgress）以节省资源
              enabled: isSelected,
              child: child,
            ),
          ),
        );
      }).toList(),
    );
  }
}