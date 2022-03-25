import 'package:flutter/material.dart';

import '../views/loginSignup/loginView/loginView.dart';
import '../views/placeholders/placeholderScreen.dart';
import 'routeNames.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    //Login
    case LoginRoute:
      return _getPageRoute(LoginView());
    //Placeholder
    case PlaceholderRoute:
      return _getPageRoute(PlaceholderScreen());
    default:
      return _getPageRoute(LoginView());
  }
}

PageRoute _getPageRoute(Widget child) {
  return _FadeRoute(child: child);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  _FadeRoute({required this.child})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
