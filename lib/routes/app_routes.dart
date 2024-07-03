part of 'app_pages.dart';

abstract class AppRoutes {
  static const welcome = '/welcome';
  static const home = '/';
  static const videos = '/videos';
}

extension RoutesExtension on String {
  String toRoute() => '/${toLowerCase()}';
}
