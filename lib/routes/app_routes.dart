part of 'app_pages.dart';

abstract class AppRoutes {
  static const welcome = '/welcome';
  static const home = '/';
  static const videos = '/videos';
  static const dashboard = '/dashboard';
}

extension RoutesExtension on String {
  String toRoute() => '/${toLowerCase()}';
}
