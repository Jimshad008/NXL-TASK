
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:nxl_task/features/auth/model/user_model.dart';
import 'package:nxl_task/util/gradient_iems.dart';
import '../../../app/app_router.dart';
import '../../../app/app_text_style.dart';
import '../../../app/palette.dart';
import '../../../constants/assets.dart';
import '../../../util/alert.dart';
import '../../../util/navigation_service.dart';
import '../../../util/password_validator.dart';
import '../../../util/ui_helper.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/text_form_field_input_decoration.dart';
import '../../auth/controller/login_controller.dart';

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});

  @override
  ConsumerState<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  final obscureProvider = StateProvider<bool>((ref) {
    return true;
  });
  final obscureConfProvider = StateProvider<bool>((ref) {
    return true;
  });

  @override
  Widget build(BuildContext context,) {
    return Scaffold(

      body: SafeArea(
          child: SizedBox(
           
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(icon: GradientItems(child: Icon(CupertinoIcons.back,color: Palette.white,)), onPressed:() => NavigationService.pop(),),
                    ],
                  ),
                  verticalSpaceMedium,
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                  
                      SizedBox(
                        width: getWidth(context: context)*0.6,
                        height: 60.h,
                        child: Image.asset(
                          Assets.appLogo,
                          fit: BoxFit.contain,
                        ),
                      ),
                      verticalSpaceLarge,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Registration",
                              style: AppTextStyle().titleMedium,
                            ),
                            verticalSpaceMedium,
                            FormBuilder(
                              key: _formKey,
                              autovalidateMode: AutovalidateMode.onUnfocus,
                              // initialValue: {
                              //   'identification':'5710080281081',
                              //       'password':'Test123;'
                              // },
                              child: Column(
                                children: [
                                  verticalSpaceSmall,
                  
                                  ///email
                                  FormBuilderTextField(
                                    cursorColor: Palette.white,
                                    style: formBuilderTextStyle(context),
                                    maxLines: 1,
                                    name: 'name',
                                    decoration: buildInputDecoration(context,
                                        prefixIcon: Icon(
                                          CupertinoIcons.person_solid,
                                          color: Colors.white,
                                        ),
                                        labelText: 'Name'),
                                    validator: (value) {
                                      if (value == null || value.trim().isEmpty) {
                                        return 'The name is required.';
                                      }
                  
                                      if (value.trim().length < 2) {
                                        return 'The name must contain at least 2 characters.';
                                      }
                                      return null; // valid
                                    },
                                    // FormBuilderValidators.numeric(
                                    //     errorText:
                                    //         'Please enter a valid ID Number'),
                  
                                    keyboardType: TextInputType.text,
                                  ),
                                  verticalSpaceSX,
                                  FormBuilderTextField(
                                    cursorColor: Palette.white,
                  
                                    style: formBuilderTextStyle(context),
                                    maxLines: 1,
                                    name: 'mail',
                                    decoration: buildInputDecoration(context,
                                        prefixIcon: Icon(CupertinoIcons.mail_solid,color: Colors.white,),
                                        labelText: 'Email'),
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(
                                          errorText:
                                          'Please enter a valid email address.'),
                                      FormBuilderValidators.maxLength(100,errorText:   'Please enter a valid email address.'),
                                      FormBuilderValidators.email(
                                          errorText:  'Please enter a valid email address.'
                                      ),
                                      FormBuilderValidators.minLength(
                                        3,
                                        errorText:
                                        "The email entered is too short; please enter a valid email address.",
                                      ),
                                      // FormBuilderValidators.numeric(
                                      //     errorText:
                                      //         'Please enter a valid ID Number'),
                                    ]),
                                    keyboardType: TextInputType.text,
                                  ),
                                  verticalSpaceSX,
                  
                                  ///password
                                  Consumer(
                                      builder: (context,ref,child) {
                                        bool obscureText=ref.watch(obscureProvider);
                                        return FormBuilderTextField(
                                          cursorColor: Palette.white,
                                          style: formBuilderTextStyle(context),
                                          maxLines: 1,
                                          name: 'password',
                                          // enabled: false,
                                          obscureText: obscureText,
                  
                                          decoration: buildInputDecoration(
                                            prefixIcon: Icon(Icons.lock,color: Colors.white,),
                                            context,
                                            labelText:'Password',
                  
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                obscureText
                                                    ? Icons.visibility_off
                                                    :Icons.visibility ,
                                                color: Colors.white,
                                              ),
                                              onPressed: () {
                                                ref.read(obscureProvider.notifier).update((state) => !obscureText,);
                                              },
                                            ),
                                          ),
                                          validator: passwordValidator(),
                  
                                          keyboardType: TextInputType.text,
                                        );
                                      }
                                  ),
                                  verticalSpaceSX,
                                  Consumer(
                                    builder: (context,ref,child) {
                                      bool obscureConfText=ref.watch(obscureProvider);
                                      return FormBuilderTextField(
                                        cursorColor: Palette.white,
                                        style: formBuilderTextStyle(context),
                                        maxLines: 1,
                                        name: 'confirmPassword',
                                        // enabled: false,
                                        obscureText: obscureConfText,
                                        decoration: buildInputDecoration(
                                          prefixIcon: Icon(
                                            Icons.lock,
                                            color: Colors.white,
                                          ),
                                          context,
                                          labelText: 'Confirm the password',
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              obscureConfText
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              color: Colors.white,
                                            ),
                                            onPressed: () {
                                              ref.read(obscureConfProvider.notifier).update((state) => !obscureConfText,);
                                            },
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please confirm your password.';
                                          }
                                          final password = _formKey
                                              .currentState?.fields['password']?.value;
                                          if (value != password) {
                                            return 'The passwords do not match.';
                                          }
                                          return null;
                                        },
                                        keyboardType: TextInputType.text,
                                      );
                                    }
                                  ),
                  
                                  verticalSpaceLarge,
                                  Consumer(
                                    builder: (context, ref, child) {
                                      final state = ref.watch(loginControllerProvider);
                                      final isLoading = state is LoginStateLoading;
                  
                                      /* if (state is LoginStateSuccess) {
                                            WidgetsBinding.instance
                                                .addPostFrameCallback(
                                              (timeStamp) {
                                                NavigationService.pushReplacement(
                                                    page: AppRouter.dashBoard);
                                              },
                                            );
                                          }*/
                  
                                      return CustomElevatedButton(
                                        isLoading: isLoading,
                                        height: 50.h,
                                        width: 160.w,
                                        label: 'Register',
                                        onPressed: () {
                                          submit(ref, context);
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      verticalSpaceMedium,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: AppTextStyle().bodyMedium.copyWith(fontSize: 14.sp),
                          ),
                          TextButton(
                              onPressed: () {
                                NavigationService.push(
                                  page: AppRouter.login,
                                );
                              },
                              child: GradientItems(
                                child: Text(
                                  "Login here",
                                  style: AppTextStyle().bodyMedium.copyWith(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              )),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }

  void submit(WidgetRef ref, BuildContext context) {
    // NavigationService.pushReplacement(page: AppRouter.gender);
    //
    if (_formKey.currentState?.validate() ?? false) {
    var res=UserModel(name: _formKey.currentState?.fields['name']?.value ?? '', email: _formKey.currentState?.fields['mail']?.value ?? '', password: _formKey.currentState?.fields['password']?.value ?? '');

      ref.read(loginControllerProvider.notifier).signUpWithEmailPassword(
         res);
    } else {
      Alert.showToast('Please enter valid information.');
    }
  }
}
