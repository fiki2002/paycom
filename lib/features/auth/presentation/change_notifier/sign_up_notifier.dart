import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:paycom/cores/constants/assets.dart';
import 'package:paycom/cores/utils/enums.dart';

class SignUpNotifier extends ChangeNotifier {
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
  }

  void updateSignUpData(var key, var value) {
    if (_signUpData.containsKey(key)) {
      _signUpData.update(key, (_) => value);
    } else {
      _signUpData.putIfAbsent(key, () => value);
    }
    log(_signUpData[firstName].toString());

    notifyListeners();
  }
}
