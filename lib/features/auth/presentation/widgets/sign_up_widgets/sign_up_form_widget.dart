import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paycom/cores/components/custom_text_widget.dart';
import 'package:paycom/cores/components/custom_textfield.dart';
import 'package:paycom/cores/constants/assets.dart';
import 'package:paycom/cores/constants/font_size.dart';
import 'package:paycom/cores/extensions/notifiers.dart';
import 'package:paycom/cores/utils/sizer_utils.dart';
import 'package:paycom/cores/utils/validator.dart';
import 'package:paycom/features/auth/presentation/change_notifier/sign_up_notifier.dart';
import 'package:provider/provider.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpNotifier>(builder: (_, value, __) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFieldWidget(
            hintText: 'Full Name',
            prefixWidget: SvgPicture.asset(person, fit: BoxFit.scaleDown),
            validator: nameValidator,
            textInputType: TextInputType.text,
            onSaved: (v) => context.signUp.splitFullNameFromTextField(v),
          ),
          verticalSpace(15),
          TextFieldWidget(
            hintText: 'Email Address',
            prefixWidget: SvgPicture.asset(mail, fit: BoxFit.scaleDown),
            validator: emailValidator,
            textInputType: TextInputType.emailAddress,
            onSaved: (v) => context.signUp.updateSignUpData(email, v),
          ),
          verticalSpace(15),
          TextFieldWidget(
            hintText: 'Phone Number',
            prefixWidget: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                horizontalSpace(12),
                SvgPicture.asset(phone, fit: BoxFit.scaleDown),
                horizontalSpace(12),
                SvgPicture.asset(naija, fit: BoxFit.scaleDown),
                horizontalSpace(7),
                SvgPicture.asset(arrowDown, fit: BoxFit.scaleDown),
                horizontalSpace(3),
                TextWidget(
                  '+234',
                  fontWeight: FontWeight.w400,
                  fontSize: sp(12),
                ),
                horizontalSpace(3),
              ],
            ),
            onSaved: (v) => context.signUp.updateSignUpData(formattedPhone, v),
            validator: mobileValidator,
            textInputType: TextInputType.number,
          ),
          verticalSpace(15),
          TextFieldWidget(
            hintText: 'Password',
            prefixWidget: SvgPicture.asset(lock, fit: BoxFit.scaleDown),
            validator: passwordValidator,
            isPassword: true,
            textInputType: TextInputType.visiblePassword,
            onSaved: (v) => context.signUp.updateSignUpData(password, v),
          ),
          verticalSpace(5),
          context.signUp.signUpData[password] == ''
              ? TextWidget(
                  '*Password should contain maximum 6 characters',
                  fontSize: sp(kfsVeryTinyText),
                )
              : const SizedBox.shrink()
        ],
      );
    });
  }
}
