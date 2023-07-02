import 'package:flutter/material.dart';
import 'package:paycom/app/app.dart';
import 'package:paycom/app/locators.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SetUpLocators.init();

  runApp(MyApp());
}
