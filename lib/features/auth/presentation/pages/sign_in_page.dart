import 'package:flutter/material.dart';
import 'package:paycom/cores/components/custom_button.dart';
import 'package:paycom/cores/components/custom_text_widget.dart';
import 'package:paycom/cores/constants/font_size.dart';
import 'package:paycom/cores/constants/palette.dart';
import 'package:paycom/cores/extensions/notifiers.dart';
import 'package:paycom/cores/navigator/app_router.dart';
import 'package:paycom/cores/utils/sizer_utils.dart';
import 'package:paycom/features/auth/presentation/change_notifier/sign_in_notifier.dart';
import 'package:paycom/features/auth/presentation/pages/sign_up_page.dart';
import 'package:paycom/features/auth/presentation/widgets/sign_in_widgets/sign_in_form_widgets.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  static const route = "/signIn";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Consumer<SignInNotifier>(builder: (_, value, __) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: sp(35),
                  vertical: sp(kfsLargerText),
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: TextWidget(
                          'payCOM',
                          fontSize: sp(kfsLargerText),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      verticalSpace(15),
                      Align(
                        alignment: Alignment.center,
                        child: TextWidget(
                          'Welcome',
                          fontSize: sp(kfsLargerText),
                          textColor: kcSecondaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      verticalSpace(22),
                      const SignInFormWidget(),
                      value.isLoading
                          ? const Button.loading()
                          : Button(
                              text: 'Sign In',
                              onTap: () => signUserIn(context),
                            ),
                      verticalSpace(10),
                      GestureDetector(
                        onTap: () {
                          AppRouter.instance.navigateTo(SignUpPage.route);
                        },
                        child: Center(
                          child: TwoSpanTextWidget(
                            'Don\'t have an account? ',
                            'Register now',
                            fontSize: sp(12),
                            fontSize2: sp(12),
                            textColor: kcPrimaryColor,
                            textColor2: kcPrimaryColor,
                            fontWeight: FontWeight.w400,
                            fontWeight2: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  void signUserIn(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Future.delayed(const Duration(milliseconds: 500)).then(
        (_) {
          context.signIn.signIn(context);
        },
      );
    }
  }
}
