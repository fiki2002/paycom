import 'package:flutter/material.dart';
import 'package:paycom/cores/components/custom_text_widget.dart';
import 'package:paycom/cores/constants/font_size.dart';
import 'package:paycom/cores/constants/palette.dart';
import 'package:paycom/cores/utils/sizer_utils.dart';
import 'package:paycom/features/onboarding/change_notifier/splash_notifier.dart';
import 'package:paycom/features/onboarding/widgets/custom_container.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatelessWidget {
  static const route = "/splashPage";

  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<SplashScreenNotifier>(context, listen: false).startTime();
    return Scaffold(
      backgroundColor: kcPrimaryColor,
      body: SafeArea(
        child: Consumer<SplashScreenNotifier>(
          builder: (_, value, __) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TwoSpanTextWidget(
                    'pay',
                    'COM',
                  ),
                  verticalSpace(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomContainer(color: kcSecondaryColor),
                      horizontalSpace(6),
                      const CustomContainer(color: kcWhiteColor)
                    ],
                  ),
                  verticalSpace(7),
                  const TwoSpanTextWidget(
                    'All in one money app',
                    '',
                    fontStyle: FontStyle.italic,
                    fontSize: kfsLargerText,
                    fontWeight: FontWeight.w300,
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
