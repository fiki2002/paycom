import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:paycom/cores/exceptions/base_exceptions.dart';
import 'package:paycom/cores/failure/error_text.dart';
import 'package:paycom/cores/failure/failure.dart';
import 'package:paycom/cores/utils/logger.dart';
import 'package:paycom/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:paycom/features/auth/data/model/sign_up_model.dart';
import 'package:paycom/features/auth/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource remoteDatasource;
  AuthenticationRepositoryImpl({
    required this.remoteDatasource,
  });

  @override
  Future<Either<Failure, SignUpResponseModel>> signUp(
      Map<String, dynamic> map) async {
    try {
      final res = await remoteDatasource.signUp(map);
      return Right(res);
    } on SocketException {
      return const Left(
        BaseFailures(message: ErrorText.noInternet),
      );
    } catch (e, s) {
      LoggerHelper.log(e, s);
      if (e is BaseFailures) {
        return Left(BaseFailures(message: e.message));
      }

      return Left(BaseFailures(message: e.toString()));
    }
  }
}
