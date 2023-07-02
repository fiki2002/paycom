import 'package:paycom/features/auth/domain/entities/sign_in_response_entity.dart';

class SignInResponseModel extends SignInResponseEntity {
  const SignInResponseModel({
    super.defaultCountry,
    super.email,
    super.firstName,
    super.formattedPhone,
    super.lastName,
    super.picture,
    super.status,
    super.token,
    super.userId,
    super.userStatus,
    super.message
  });

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "user_id": userId,
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "formattedPhone": formattedPhone,
      "picture": picture,
      "defaultCountry": defaultCountry,
      "token": token,
      "status": status,
      "user-status": userStatus,
      "message": message
    };
  }

  factory SignInResponseModel.fromMap(Map<String, dynamic> json) =>
      SignInResponseModel(
        userId: json["user_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        formattedPhone: json["formattedPhone"],
        picture: json["picture"],
        defaultCountry: json["defaultCountry"],
        token: json["token"],
        status: json["status"],
        userStatus: json["user-status"],
        message: json["message"],
      );
}
