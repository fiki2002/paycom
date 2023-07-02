import 'package:equatable/equatable.dart';

class SignInResponseEntity extends Equatable {
  final int? userId;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? formattedPhone;
  final String? picture;
  final String? defaultCountry;
  final String? token;
  final int? status;
  final String? userStatus;
  final String? message;

  const SignInResponseEntity( {
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.formattedPhone,
    this.picture,
    this.defaultCountry,
    this.token,
    this.status,
    this.userStatus,
    this.message,
  });

  @override
  List<Object?> get props => [
        userId,
        firstName,
        lastName,
        email,
        formattedPhone,
        picture,
        defaultCountry,
        token,
        status,
        userStatus,
        message
      ];

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
}
