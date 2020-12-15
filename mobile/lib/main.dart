import 'dart:async';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:makeaplan/service/greeter_service.dart';
import 'package:makeaplan/ui/error_page.dart';
import 'package:makeaplan/ui/home.dart';
import 'package:makeaplan/ui/pages/on_boarding.dart';
import 'package:makeaplan/ui/pages/start_use.dart';

import 'global.dart';
import 'manager/them/them_manager.dart';

void main() {
  launchApp();
}

void launchApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await start();
  } catch (err) {
    runApp(LandingToErrorPage(
      err: err,
    ));
  }
}

start() async {
  await Global.init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  final firstInit = await Global.firstInit();

  if (firstInit) {
    run(LandingToOnBoardingPage());
  } else {
    final success = await GreeterService().sayHello();
    if (success) {
      run(LandingToHomePage());
    } else {
      run(LandingToStartUsePage());
    }
  }
}

run(app) {
  runZonedGuarded<Future<void>>(() async {
    runApp(app);
  }, (Object error, StackTrace stackTrace) {
    runApp(LandingToErrorPage(
      printError: true,
      err: error,
    ));
  });
}

class LandingToStartUsePage extends StatelessWidget {
  const LandingToStartUsePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: ThemManager().them,
      child: Builder(
        builder: (context) {
          return MaterialApp(
              theme: ThemeProvider.of(context),
              debugShowCheckedModeBanner: false,
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                DefaultCupertinoLocalizations.delegate
              ],
              supportedLocales: [
                const Locale("en", "US"),
                const Locale("zh", "CN"),
              ],
              home: StartUsePage());
        },
      ),
    );
  }
}

class LandingToHomePage extends StatelessWidget {
  const LandingToHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: ThemManager().them,
      child: Builder(
        builder: (context) {
          return MaterialApp(
              theme: ThemeProvider.of(context),
              debugShowCheckedModeBanner: false,
              title: 'Make A Plan',
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                DefaultCupertinoLocalizations.delegate
              ],
              supportedLocales: [
                const Locale("en", "US"),
                const Locale("zh", "CN"),
              ],
              home: MyHomePage());
        },
      ),
    );
  }
}

class LandingToOnBoardingPage extends StatelessWidget {
  const LandingToOnBoardingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: ThemManager().them,
      child: Builder(
        builder: (context) {
          return MaterialApp(
              theme: ThemeProvider.of(context),
              debugShowCheckedModeBanner: false,
              title: 'Make A Plan',
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                DefaultCupertinoLocalizations.delegate
              ],
              supportedLocales: [
                const Locale("en", "US"),
                const Locale("zh", "CN"),
              ],
              home: OnBoardingPage());
        },
      ),
    );
  }
}

class LandingToErrorPage extends StatelessWidget {
  final err;
  final bool printError;

  const LandingToErrorPage({
    Key key,
    this.err,
    this.printError = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: ThemManager().them,
      child: Builder(
        builder: (context) {
          return MaterialApp(
              theme: ThemeProvider.of(context),
              debugShowCheckedModeBanner: false,
              title: 'Make A Plan',
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                DefaultCupertinoLocalizations.delegate
              ],
              supportedLocales: [
                const Locale("en", "US"),
                const Locale("zh", "CN"),
              ],
              home: ErrorPage(
                printError: printError,
                error: err,
                exitAppOnly: true,
              ));
        },
      ),
    );
  }
}
