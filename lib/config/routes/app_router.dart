import 'package:flutter/material.dart';

class AppRouter {
  // Route names
  static const String home = '/';
  static const String login = '/login';
  static const String register = '/register';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Home')),
          ),
        );
      case login:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Login')),
          ),
        );
      case register:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Register')),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Page Not Found')),
          ),
        );
    }
  }
}
