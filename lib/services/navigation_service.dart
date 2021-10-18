import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(
    String routeName,
  ) {
    return navigatorKey.currentState.pushNamed(routeName);
  }

  Future<dynamic> navigateAndRemovedTo(
    String routeName,
  ) {
    return navigatorKey.currentState.pushReplacementNamed(routeName);
  }

  void goBack() {
    return navigatorKey.currentState.pop();
  }
}
