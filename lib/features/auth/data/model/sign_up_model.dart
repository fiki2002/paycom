import 'package:paycom/features/auth/domain/entities/sign_up_response_entity.dart';

class SignUpResponseModel extends SignUpResponseEntity {
  const SignUpResponseModel({
    super.status,
    super.reason,
    super.message,
  });

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'reason': reason,
      'message': message,
    };
  }

  factory SignUpResponseModel.fromMap(Map<String, dynamic> map) {
    return SignUpResponseModel(
      status: map['status'] as int,
      reason: map['reason'] as String,
      message: map['message'] as String,
    );
  }
}
