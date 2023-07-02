import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paycom/cores/constants/palette.dart';
import 'package:paycom/cores/utils/sizer_utils.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({
    Key? key,
    this.textEditingController,
    this.autoCorrect = true,
    required this.hintText,
    this.validator,
    this.textInputType = TextInputType.text,
    this.isPassword = false,
    this.enabled = true,
    this.maxLine = 1,
    this.suffix,
    this.prefix,
    this.boldHintText = false,
    this.prefixWidget,
    this.inputFormatters,
    this.onChanged,
    required this.onSaved,
  }) : super(key: key);

  final TextEditingController? textEditingController;
  final bool autoCorrect;
  final String hintText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputType textInputType;
  final bool isPassword;
  final bool enabled;
  final bool boldHintText;
  final int? maxLine;
  final IconData? suffix;
  final IconData? prefix;
  final Widget? prefixWidget;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String) onSaved;

  final ValueNotifier<bool> obscureText = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: obscureText,
      builder: (BuildContext context, bool value, dynamic child) {
        return SizedBox(
          child: TextFormField(
            inputFormatters: inputFormatters,
            maxLines: maxLine,
            enabled: enabled,
            cursorColor: kcPrimaryColor,
            onSaved: (v) {
              onSaved(v ?? '');
            },
            style: TextStyle(
              color: kcPrimaryColor,
              fontWeight: FontWeight.w400,
              fontSize: sp(12),
            ),
            onChanged: (String val) {
              if (onChanged == null) return;

              onChanged!(val.trim());
            },
            controller: textEditingController,
            autocorrect: autoCorrect,
            autovalidateMode:
                validator != null ? AutovalidateMode.onUserInteraction : null,
            decoration: InputDecoration(
              errorMaxLines: 2,
              filled: true,
              fillColor: kcWhiteColor,
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: kcBorderColor),
                borderRadius: BorderRadius.circular(sp(8.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: kcPrimaryColor),
                borderRadius: BorderRadius.circular(sp(8.0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: kcBorderColor),
                borderRadius: BorderRadius.circular(sp(8.0)),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: kcPrimaryColor),
                borderRadius: BorderRadius.circular(sp(8.0)),
              ),
              hintText: hintText,
              hintStyle: GoogleFonts.poppins(
                color: kcPrimaryColor,
                fontWeight: FontWeight.w400,
                fontSize: sp(12),
              ),
              prefixIcon: prefixWidget,
              suffixIcon: isPassword == true
                  ? suffixWidget(value)
                  : suffix != null
                      ? Icon(suffix)
                      : const SizedBox(),
            ),
            keyboardType: textInputType,
            obscureText: value && isPassword,
            validator: (String? val) {
              if (val == null || validator == null) return null;

              return validator!(val.trim());
            },
          ),
        );
      },
    );
  }

  IconButton suffixWidget(bool value) {
    if (value) {
      return IconButton(
        icon: Icon(CupertinoIcons.eye_slash, size: sp(20)),
        color: kcPrimaryColor,
        onPressed: () => obscureText.value = !obscureText.value,
      );
    } else {
      return IconButton(
        icon: Icon(CupertinoIcons.eye, size: sp(20)),
        color: kcPrimaryColor,
        onPressed: () => obscureText.value = !obscureText.value,
      );
    }
  }
}
