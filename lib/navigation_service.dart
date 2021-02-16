import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
  new GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState.pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> replaceTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  void goBack({dynamic arguments}) {
    return navigatorKey.currentState.pop(arguments);
  }
}