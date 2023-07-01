import 'dart:async';

import 'package:flutter/material.dart';
import 'package:paycom/cores/navigator/app_router.dart';
import 'package:paycom/features/auth/presentation/pages/sign_up.dart';

class SplashScreenNotifier extends ChangeNotifier {
  /// Determines how long the splash screen would take
  Future<Timer> startTime() async {
    var duration = const Duration(milliseconds: 3000);
    return Timer(duration, navigateToSignUp);
  }

  Future<void> navigateToSignUp() async {
    await AppRouter.instance.navigateToAndReplace(SignUpPage.route);
  }
}
