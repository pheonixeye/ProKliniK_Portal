import 'package:equatable/equatable.dart';

class FormSubmission extends Equatable {
  final String username;
  final String email;
  final String phone;
  final String message;
  final String? status;

  const FormSubmission({
    required this.username,
    required this.email,
    required this.phone,
    required this.message,
    this.status,
  });

  FormSubmission copyWith({
    String? username,
    String? email,
    String? phone,
    String? message,
    String? status,
  }) {
    return FormSubmission(
      username: username ?? this.username,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      'phone': phone,
      'message': message,
      'status': status,
    };
  }

  factory FormSubmission.fromJson(Map<String, dynamic> map) {
    return FormSubmission(
      username: map['username'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      message: map['message'] as String,
      status: map['status'] != null ? map['status'] as String : null,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      username,
      email,
      phone,
      message,
      status,
    ];
  }
}
