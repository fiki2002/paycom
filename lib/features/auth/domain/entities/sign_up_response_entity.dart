import 'package:equatable/equatable.dart';

class SignUpResponseEntity extends Equatable {
  final int? status;
  final String? reason;
  final String? message;

  const SignUpResponseEntity({this.status, this.reason, this.message});

  
  @override
  List<Object?> get props => [status, reason, message];


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'reason': reason,
      'message': message,
    };
  }
}
