import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart';
@freezed
class UserModel with _$UserModel{
const factory UserModel({

 required String name,
  required String email,
  required String password,



}) =_UserModel;
const UserModel._();
factory UserModel.fromJson(Map<String, dynamic> json) =>
    _$UserModelFromJson(json);

  @override
  // TODO: implement address
  String get password => throw UnimplementedError();

  @override
  // TODO: implement email
  String get email => throw UnimplementedError();

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}