import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

FormFieldValidator<String> passwordValidator() {
  return FormBuilderValidators.compose([
    FormBuilderValidators.required(errorText: 'Please enter a valid password.'),
    FormBuilderValidators.maxLength(100),
    FormBuilderValidators.minLength(8,
        errorText: 'Your password must be at least 8 characters long.'),
    FormBuilderValidators.hasUppercaseChars(
      atLeast: 1,
      errorText: 'The password must include at least one uppercase letter.',
    ),
    FormBuilderValidators.hasLowercaseChars(
      atLeast: 1,
      errorText: 'The password must include at least one lowercase letter.',
    ),
    FormBuilderValidators.hasNumericChars(
        atLeast: 1, errorText: 'The password must include at least one digit.'),
    FormBuilderValidators.matchNot(RegExp(r'^\S+$'),
        // checkNullOrEmpty: true,
        errorText: "The password cannot contain spaces."),
    FormBuilderValidators.hasSpecialChars(
        atLeast: 1,
        errorText: 'The password must include at least one special character.'),
  ]);
}
