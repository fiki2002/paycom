import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import 'package:paycom/cores/constants/assets.dart';
import 'package:paycom/cores/failure/failure.dart';
import 'package:paycom/cores/navigator/app_router.dart';
import 'package:paycom/cores/utils/enums.dart';
import 'package:paycom/cores/utils/snack_bar_service.dart';
import 'package:paycom/features/auth/data/model/sign_up_model.dart';
import 'package:paycom/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:paycom/features/auth/presentation/pages/sign_in_page.dart';

class SignUpNotifier extends ChangeNotifier {
  final SignUpUsecase signUpUsecase;

  SignUpNotifier({
    required this.signUpUsecase,
  });

  AccountType selectedType = AccountType.user;

  void onChooseAccountType(AccountType value) {
    selectedType = value;
    notifyListeners();
  }

  Map<String, String> get signUpData => _signUpData;

  void splitFullNameFromTextField(String value) {
    List<String> names = value.trim().split(' ');
    updateSignUpData(firstName, names[0]);
    updateSignUpData(lastName, names[1]);
    notifyListeners();
  }

  Map<String, String> _signUpData = {
    firstName: '',
    lastName: '',
    email: '',
    password: '',
    defaultCountry: 'ng',
    carrierCode: '234',
    type: 'user',
    formattedPhone: '',
  };

  void resetSignUpData() {
    _signUpData = {
      firstName: '',
      lastName: '',
      email: '',
      password: '',
      defaultCountry: 'ng',
      carrierCode: '234',
      type: 'user',
      formattedPhone: '',
    };
    notifyListeners();
  }

  void updateSignUpData(var key, var value) {
    if (_signUpData.containsKey(key)) {
      _signUpData.update(key, (_) => value);
    } else {
      _signUpData.putIfAbsent(key, () => value);
    }
    log(_signUpData.toString());

    notifyListeners();
  }

  bool isLoading = false;
  Future<Either<Failure, SignUpResponseModel>> signUp(
      BuildContext context) async {
    isLoading = true;
    notifyListeners();
    _signUpData[formattedPhone] = '+234${_signUpData[formattedPhone]}';
    var data = await signUpUsecase.call(_signUpData);

    return data.fold(
      (l) {
        isLoading = false;
        notifyListeners();
        resetSignUpData();

        SnackBarService.showSuccessSnackBar(
          context: context,
          message: l.message,
        );
        return Left(l);
      },
      (r) {
        isLoading = false;
        notifyListeners();
        resetSignUpData();
        AppRouter.instance.clearRouteAndPush(SignInPage.route);

        SnackBarService.showSuccessSnackBar(
          context: context,
          message: r.message ??
              'We sent you an activation code. Check your email and click on the link to verify',
        );
        return Right(r);
      },
    );
  }
}
