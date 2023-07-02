import 'package:dartz/dartz.dart';
import 'package:paycom/features/auth/data/model/sign_up_model.dart';

abstract class AuthenticationRepository {
  Future<Either<void, SignUpResponseModel>> signUp(Map<String, dynamic> map);
}
