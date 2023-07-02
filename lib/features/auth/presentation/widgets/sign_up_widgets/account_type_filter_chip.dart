import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paycom/cores/components/custom_text_widget.dart';
import 'package:paycom/cores/constants/assets.dart';
import 'package:paycom/cores/constants/palette.dart';
import 'package:paycom/cores/utils/enums.dart';
import 'package:paycom/cores/utils/sizer_utils.dart';
import 'package:paycom/features/auth/presentation/change_notifier/sign_up_notifier.dart';
import 'package:provider/provider.dart';

class AccountTypeFilterChip extends StatelessWidget {
  const AccountTypeFilterChip(
      {super.key, required this.icon, required this.title, required this.type});
  final String icon;
  final String title;
  final AccountType type;
  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpNotifier>(builder: (_, value, __) {
      return Expanded(
        child: GestureDetector(
          onTap: () => value.onChooseAccountType(type),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: value.selectedType == type ? kcButtonText : kcWhiteColor,
              border: Border.all(color: kcPrimaryColor),
              borderRadius: BorderRadius.circular(sp(8)),
            ),
            child: Row(
              mainAxisAlignment: value.selectedType == type
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              children: [
                value.selectedType == type
                    ? Padding(
                        padding: EdgeInsets.only(left: sp(3), top: sp(2)),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: CircleAvatar(
                            backgroundColor: kcSecondaryColor,
                            radius: sp(5),
                            child: SvgPicture.asset(check),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
                value.selectedType == type
                    ? horizontalSpace(20)
                    : const SizedBox.shrink(),
                SvgPicture.asset(icon),
                horizontalSpace(11),
                TextWidget(title),
              ],
            ),
          ),
        ),
      );
    });
  }
}
