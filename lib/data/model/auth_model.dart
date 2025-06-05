import 'package:json_annotation/json_annotation.dart';

part 'auth_model.g.dart';

@JsonSerializable()
class AuthModel {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String password;

  AuthModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });
  factory AuthModel.fromJson(Map<String, dynamic>json)=> _$AuthModelFromJson(json);

  Map<String, dynamic> toJson() =>_$AuthModelToJson(this);
}