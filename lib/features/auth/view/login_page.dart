import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:nxl_task/app/theme_x.dart';
import 'package:nxl_task/features/auth/model/login_add_body_model.dart';
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
import '../controller/login_controller.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final obscureProvider = StateProvider<bool>((ref) {
    return true;
  });
  final _formKey = GlobalKey<FormBuilderState>();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(child: SizedBox(
        width: getWidth(context: context),
        height: getHeight(context: context)-50,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: [

            SizedBox(
              width: getWidth(context: context)*0.6,
              height: 60.h,
              child: Image.asset(
                Assets.appLogo,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 25.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Login",style: AppTextStyle().titleMedium,),
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

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                NavigationService.push(page: AppRouter.forgotPassword);
                              },
                              child: Text(
                                'Forgot password?',
                                style: context
                                    .bodySmall()
                                    .copyWith(color: Colors.blueAccent,decoration: TextDecoration.underline,decorationColor: Colors.black),
                              ),
                            ),

                          ],
                        ),
                        verticalSpaceMedium,
                        Consumer(
                          builder: (context, ref, child) {
                            final state =
                            ref.watch(loginControllerProvider);
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
                              label: 'Login',
                              onPressed: () {
                                submit();
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

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("No account?",style: AppTextStyle().bodyMedium.copyWith(fontSize: 14),),
                TextButton(
                    onPressed:() {
                      NavigationService.push(
                        page: AppRouter.register,
                      );
                    } ,
                    child: GradientItems(child: Text("Register here",style: AppTextStyle().bodyMedium.copyWith(fontSize: 14.sp,fontWeight: FontWeight.bold,color: Colors.white),))),
              ],
            )
          ],
        ),
      )),

    );
  }

  void submit() {
    // Navigator.pushNamed(context, AppRouter.whatYouAre);
    if (_formKey.currentState?.validate() ?? false) {
      var res=LoginAddBodyModel(email: _formKey.currentState?.fields['mail']?.value ?? '', password: _formKey.currentState?.fields['password']?.value ?? '');

      ref.read(loginControllerProvider.notifier).loginWithEmailPassword(res
        );
    }
    else {
      Alert.showToast('Please enter a valid email address and password.');
    }
  }
}
