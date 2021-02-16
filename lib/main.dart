import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_marvel_infinity/app_localizations.dart';
import 'package:flutter_marvel_infinity/controller/cart_controller.dart';
import 'package:flutter_marvel_infinity/controller/profile_controller.dart';
import 'package:flutter_marvel_infinity/presentation/comics_list_screen.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<CartController>(CartController());
  getIt.registerSingleton<ProfileController>(ProfileController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      supportedLocales: [
        Locale('en', 'US'), Locale('pt', 'BR')],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: Platform.isAndroid
          ? (locale, supportedLocales) {
        // Verifica se o dispositivo tem suporte dos idiomas
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        // Caso não existe, usa o primeiro, preferencialmente inglês
        return supportedLocales.first;
      }
          : null,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ComicsListScreen(),
    );
  }
}
