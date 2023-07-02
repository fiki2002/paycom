import 'package:dartz/dartz.dart';
import 'package:paycom/cores/failure/failure.dart';
import 'package:paycom/features/auth/data/model/sign_in_model.dart';
import 'package:paycom/features/auth/data/model/sign_up_model.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, SignUpResponseModel>> signUp(Map<String, dynamic> map);
  Future<Either<Failure, SignInResponseModel>> signIn(Map<String, dynamic> map);
}
