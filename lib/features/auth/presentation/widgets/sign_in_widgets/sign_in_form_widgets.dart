import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paycom/cores/components/custom_text_widget.dart';
import 'package:paycom/cores/components/custom_textfield.dart';
import 'package:paycom/cores/constants/assets.dart';
import 'package:paycom/cores/extensions/notifiers.dart';
import 'package:paycom/cores/utils/sizer_utils.dart';
import 'package:paycom/cores/utils/validator.dart';
import 'package:paycom/features/auth/presentation/change_notifier/sign_up_notifier.dart';
import 'package:provider/provider.dart';

class SignInFormWidget extends StatelessWidget {
  const SignInFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpNotifier>(builder: (_, value, __) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFieldWidget(
            hintText: 'Email Address',
            prefixWidget: SvgPicture.asset(mail, fit: BoxFit.scaleDown),
            validator: emailValidator,
            textInputType: TextInputType.emailAddress,
            onSaved: (v) {
              context.signIn.updateSignInData(email, v);
            },
          ),
          verticalSpace(15),
          TextFieldWidget(
            hintText: 'Password',
            prefixWidget: SvgPicture.asset(lock, fit: BoxFit.scaleDown),
            validator: passwordValidator,
            isPassword: true,
            textInputType: TextInputType.visiblePassword,
            onSaved: (v) {
              context.signIn.updateSignInData(password, v);
            },
          ),
          verticalSpace(5),
          const Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: TextWidget(
              'Forgot Password?',
            ),
          ),
          verticalSpace(24),
        ],
      );
    });
  }
}
