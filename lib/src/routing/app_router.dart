import 'package:flutter/material.dart';
import 'package:flutter_app/src/features/home/home_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/console/console_page.dart';
import '../features/settings/setting_page.dart';

// 创建一个 GlobalKey 用于 Navigator，防止 Context 丢失
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

// ShellRoute: 这是一个包裹路由，用于实现底部导航栏和共用 AppBar, ShellRoute的child是被选中的页面
final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: "/console",
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => HomeScaffold(child: child),
        routes: [
          GoRoute(path: '/console', builder: (context, state) => const ConsolePage()),
          GoRoute(path: '/setting', builder: (context, state) => const SettingPage())
        ],
      ),
    ],
  );
});
