import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paycom/cores/constants/palette.dart';
import 'package:paycom/cores/navigator/app_router.dart';
import 'package:paycom/cores/navigator/router_generator.dart';
import 'package:paycom/features/onboarding/change_notifier/splash_notifier.dart';
import 'package:paycom/features/onboarding/splash_page.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: (context, Widget? child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider.value(value: SplashScreenNotifier()),
          ],
          child: MaterialApp(
            title: 'Ares',
            theme: ThemeData(
              scaffoldBackgroundColor: kcBackground,
              primaryColor: kcPrimaryColor,
              useMaterial3: true,
            ),
            initialRoute: SplashPage.route,
            onGenerateRoute: RouteGenerator.generateRoute,
            navigatorKey: AppRouter.instance.navigatorKey,
          ),
        );
      },
    );
  }
}
