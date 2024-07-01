part of 'app_pages.dart';

abstract class AppRoutes {
  static const welcome = '/welcome';
}

extension RoutesExtension on String {
  String toRoute() => '/${toLowerCase()}';
}
