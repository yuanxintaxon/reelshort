import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/home/home_binding.dart';
import '../pages/home/home_view.dart';
import '../pages/welcome/welcome_binding.dart';
import '../pages/welcome/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  /// 左滑关闭页面用于android
  static _pageBuilder({
    required String name,
    required GetPageBuilder page,
    Bindings? binding,
    bool preventDuplicates = true,
    bool fullscreenDialog = false,
    Duration? transitionDuration,
    Transition transition = Transition.cupertino,
    List<GetMiddleware>? middlewares,
  }) =>
      GetPage(
        name: name,
        page: page,
        binding: binding,
        preventDuplicates: preventDuplicates,
        fullscreenDialog: fullscreenDialog,
        transition: transition,
        transitionDuration: transitionDuration,
        popGesture: true,
        middlewares: middlewares,
      );

  static final unkownRoute = _pageBuilder(
    name: '/404',
    page: () => Scaffold(
      appBar: AppBar(
        title: const Text('Page not found'),
      ),
      body: const Center(
        child: Icon(Icons.error),
      ),
    ),
  );

  static final routes = <GetPage>[
    _pageBuilder(
      name: AppRoutes.welcome,
      page: () => WelcomePage(),
      binding: WelcomeBinding(),
      // middlewares: [AuthGuard(), ArgumentMiddleware()],
    ),
    _pageBuilder(
      name: AppRoutes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
      // middlewares: [AuthGuard(), ArgumentMiddleware()],
    ),
  ];
}
