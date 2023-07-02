import 'package:dartz/dartz.dart';
import 'package:paycom/cores/failure/failure.dart';
import 'package:paycom/cores/usecases/usecase_interface.dart';
import 'package:paycom/features/auth/data/model/sign_up_model.dart';
import 'package:paycom/features/auth/domain/repositories/authentication_repository.dart';

class SignUpUsecase
    extends UseCaseFuture<Failure, SignUpResponseModel, Map<String, dynamic>> {
  SignUpUsecase({
    required this.repository,
  });

  final AuthenticationRepository repository;

  @override
  Future<Either<Failure, SignUpResponseModel>> call(
          Map<String, dynamic> params) async =>
      await repository.signUp(params);
}
