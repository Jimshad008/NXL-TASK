
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_add_body_model.freezed.dart';

part 'login_add_body_model.g.dart';

@freezed
class LoginAddBodyModel with _$LoginAddBodyModel {

  const factory LoginAddBodyModel({
    required String email,
    required String password,


  }) = _LoginAddBodyModel;
  const LoginAddBodyModel._();
  factory LoginAddBodyModel.fromJson(Map<String, dynamic> json) =>
      _$LoginAddBodyModelFromJson(json);


  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  @override
  // TODO: implement ph_cc
  String get email => throw UnimplementedError();

  @override
  // TODO: implement phone_number
  String get password => throw UnimplementedError();
}

