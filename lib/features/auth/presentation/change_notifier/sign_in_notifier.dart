import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:paycom/cores/constants/assets.dart';
import 'package:paycom/cores/failure/failure.dart';
import 'package:paycom/cores/utils/snack_bar_service.dart';
import 'package:paycom/features/auth/data/model/sign_in_model.dart';
import 'package:paycom/features/auth/domain/usecases/sign_in_usecase.dart';

class SignInNotifier extends ChangeNotifier {
  final SignInUsecase signInUsecase;

  SignInNotifier({
    required this.signInUsecase,
  });

  Map<String, String> get signUpData => _signInData;

  Map<String, String> _signInData = {
    email: '',
    password: '',
  };

  void _resetSignInData() {
    _signInData = {
      email: '',
      password: '',
    };
    notifyListeners();
  }

  void updateSignInData(var key, var value) {
    if (_signInData.containsKey(key)) {
      _signInData.update(key, (_) => value);
    } else {
      _signInData.putIfAbsent(key, () => value);
    }

    notifyListeners();
  }

  bool isLoading = false;

  /// Calls Login endpoint
  Future<Either<Failure, SignInResponseModel>> signIn(
      BuildContext context) async {
    isLoading = true;
    notifyListeners();
    var data = await signInUsecase.call(_signInData);

    return data.fold(
      (l) {
        isLoading = false;
        notifyListeners();
        _resetSignInData();

        SnackBarService.showSuccessSnackBar(
          context: context,
          message: l.message,
        );
        return Left(l);
      },
      (r) {
        isLoading = false;
        notifyListeners();
        _resetSignInData();

        SnackBarService.showSuccessSnackBar(
          context: context,
          message: r.message ?? 'Signed In Successfully!',
        );
        return Right(r);
      },
    );
  }
}
