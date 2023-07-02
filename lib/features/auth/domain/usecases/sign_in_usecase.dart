import 'package:dartz/dartz.dart';
import 'package:paycom/cores/failure/failure.dart';
import 'package:paycom/cores/usecases/usecase_interface.dart';
import 'package:paycom/features/auth/data/model/sign_in_model.dart';
import 'package:paycom/features/auth/domain/repositories/authentication_repository.dart';

class SignInUsecase
    extends UseCaseFuture<Failure, SignInResponseModel, Map<String, dynamic>> {
  SignInUsecase({
    required this.repository,
  });

  final AuthenticationRepository repository;

  @override
  Future<Either<Failure, SignInResponseModel>> call(
          Map<String, dynamic> params) async =>
      await repository.signIn(params);
}
