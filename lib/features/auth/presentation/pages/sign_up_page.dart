import 'package:flutter/material.dart';
import 'package:paycom/cores/components/custom_button.dart';
import 'package:paycom/cores/components/custom_text_widget.dart';
import 'package:paycom/cores/constants/assets.dart';
import 'package:paycom/cores/constants/font_size.dart';
import 'package:paycom/cores/constants/palette.dart';
import 'package:paycom/cores/extensions/notifiers.dart';
import 'package:paycom/cores/utils/enums.dart';
import 'package:paycom/cores/utils/sizer_utils.dart';
import 'package:paycom/features/auth/presentation/change_notifier/sign_up_notifier.dart';
import 'package:paycom/features/auth/presentation/widgets/sign_up_widgets/account_type_filter_chip.dart';
import 'package:paycom/features/auth/presentation/widgets/sign_up_widgets/sign_up_form_widget.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  static const route = "/signUp";

  SignUpPage({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Consumer<SignUpNotifier>(builder: (_, value, __) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: sp(35), vertical: sp(kfsLargerText)),
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
                        'Join us Now',
                        fontSize: sp(kfsLargerText),
                        textColor: kcSecondaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    verticalSpace(22),
                    const SignUpFormWidget(),
                    verticalSpace(15),
                    TextWidget(
                      'Select Account Type ',
                      fontSize: sp(kfsTinyText),
                      fontWeight: FontWeight.w600,
                      textColor: kcSecondaryColor,
                    ),
                    verticalSpace(7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const AccountTypeFilterChip(
                          icon: person,
                          title: 'User',
                          type: AccountType.user,
                        ),
                        horizontalSpace(11),
                        const AccountTypeFilterChip(
                          icon: bank,
                          title: 'Merchant',
                          type: AccountType.merchant,
                        ),
                      ],
                    ),
                    verticalSpace(15),
                    TextWidget(
                      'By creating an account, you agree to our terms & conditions.',
                      fontSize: sp(kfsVeryTinyText),
                    ),
                    verticalSpace(26),
                    value.isLoading
                        ? const Button.loading()
                        : Button(
                            text: 'Create Account',
                            onTap: () => signUserUp(context),
                          )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  void signUserUp(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Future.delayed(const Duration(milliseconds: 500)).then(
        (_) {
          context.signUp.signUp(context);
        },
      );
    }
  }
}
