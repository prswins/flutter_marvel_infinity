import 'package:flutter/material.dart';
import 'package:flutter_marvel_infinity/app_localizations.dart';
import 'package:flutter_marvel_infinity/presentation/cart/cart.dart';
import 'package:flutter_marvel_infinity/presentation/profile/profile.dart';

class Routes {
  Routes._();

  //static variables
  static const String cart = '/';
  static const String profile = '/profile';
  

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case cart:
       return MaterialPageRoute(builder: (context) => Cart());
       case profile:
        return MaterialPageRoute(builder: (context) => Profile());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text(AppLocalizations.of(context).translate('path_error') +
                  ' ${settings.name}'),
            ),
          ),
        );
    }
  }
}
