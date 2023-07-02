import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paycom/cores/navigator/error_route.dart';
import 'package:paycom/features/auth/presentation/pages/sign_up_page.dart';
import 'package:paycom/features/onboarding/splash_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final Object? args = settings.arguments;

    switch (settings.name) {
      case SplashPage.route:
        return pageRoute(const SplashPage());
      case SignUpPage.route:
        return pageRoute( SignUpPage());
      default:
        return errorRoute();
    }
  }

  static PageRoute pageRoute(Widget page) {
    if (Platform.isIOS) {
      return CupertinoPageRoute(builder: (_) => page);
    }

    return MaterialPageRoute(builder: (_) => page);
  }
}
