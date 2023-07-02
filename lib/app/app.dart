import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:paycom/app/locators.dart';
import 'package:paycom/cores/constants/palette.dart';
import 'package:paycom/cores/navigator/app_router.dart';
import 'package:paycom/cores/navigator/router_generator.dart';
import 'package:paycom/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:paycom/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:paycom/features/auth/presentation/change_notifier/sign_in_notifier.dart';
import 'package:paycom/features/auth/presentation/change_notifier/sign_up_notifier.dart';
import 'package:paycom/features/onboarding/change_notifier/splash_notifier.dart';
import 'package:paycom/features/onboarding/splash_page.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final GetIt getIt = SetUpLocators.getIt;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: (context, Widget? child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider.value(value: SplashScreenNotifier()),
            ChangeNotifierProvider.value(
                value: SignUpNotifier(signUpUsecase: getIt<SignUpUsecase>())),
            ChangeNotifierProvider.value(
                value: SignInNotifier(signInUsecase: getIt<SignInUsecase>())),
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
