import 'package:paycom/app/app_config.dart';
import 'package:paycom/cores/utils/http_helper.dart';
import 'package:paycom/features/auth/data/model/sign_up_model.dart';

abstract class AuthenticationRemoteDataSource {
  Future<SignUpResponseModel> signUp(Map<String, dynamic> map);
}

class AuthenticationRemoteDataSourceImpl
    extends AuthenticationRemoteDataSource {
  @override
  Future<SignUpResponseModel> signUp(Map<String, dynamic> map) async {
    final result = await HttpHelper.post(url: signUpEndpoint, body: map);
    return SignUpResponseModel.fromMap(result['success']);
  }
}
