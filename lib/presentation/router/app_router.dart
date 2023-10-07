import 'package:flutter/material.dart';
import 'package:reddit_task/presentation/router/app_router_names.dart';
import 'package:reddit_task/presentation/screens/home_screen.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final name = settings.name;
    switch (name) {
      case AppRouterNames.rHome:
        return _route(const HomeScreen());
      default:
        return null;
    }
  }

  static Route<dynamic> _route(Widget screen) => MaterialPageRoute(
        builder: (_) => screen,
      );
}
