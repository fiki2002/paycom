import 'package:flutter/material.dart';
import 'package:paycom/cores/components/custom_text_widget.dart';
import 'package:paycom/cores/utils/sizer_utils.dart';

Route<dynamic> errorRoute() {
  return MaterialPageRoute(
    builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const TextWidget('Page Not Found'),
        ),
        body: Center(
          child: TextWidget('ERROR: Route not found', fontSize: sp(20)),
        ),
      );
    },
  );
}

Widget noPage() {
  return Scaffold(
    appBar: AppBar(title: const TextWidget('Page Not Done')),
    body: Center(
      child: TextWidget('Page Still In Production', fontSize: sp(20)),
    ),
  );
}
