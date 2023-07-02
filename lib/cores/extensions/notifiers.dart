import 'package:flutter/material.dart';
import 'package:paycom/features/auth/presentation/change_notifier/sign_up_notifier.dart';
import 'package:provider/provider.dart';

extension BuildContextNotifier on BuildContext {
  SignUpNotifier get signUp => Provider.of<SignUpNotifier>(this, listen: false);

}
