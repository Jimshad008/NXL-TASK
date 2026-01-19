
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:nxl_task/util/gradient_iems.dart';
import '../../../app/app_text_style.dart';
import '../../../app/palette.dart';
import '../../../constants/assets.dart';
import '../../../util/alert.dart';
import '../../../util/navigation_service.dart';
import '../../../util/ui_helper.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/text_form_field_input_decoration.dart';
import '../controller/login_controller.dart';
class ForgotPasswordPage extends ConsumerStatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  ConsumerState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: SizedBox(
          width: getWidth(context: context),
          height: getHeight(context: context)-50,
          child: Column(
            spacing:15.h,
            mainAxisSize: MainAxisSize.max,


            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(icon: GradientItems(child: Icon(CupertinoIcons.back,color: Palette.white,)), onPressed:() => NavigationService.pop(),),
                ],
              ),
               verticalSpaceLarge,
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
                padding:  EdgeInsets.symmetric(horizontal: 25.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Forgot password",style: AppTextStyle().titleMedium,),

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
                          verticalSpaceLarge,
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
                                label: 'Submit',
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

            ],
          ),
        ),
      )),

    );
  }
  void submit() {
    // Navigator.pushNamed(context, AppRouter.whatYouAre);
    if (_formKey.currentState?.validate() ?? false) {

      ref.read(loginControllerProvider.notifier).forgotPassword(
          _formKey.currentState?.fields['mail']?.value ?? '',
        );
    }
    else {
      Alert.showToast('Please enter a valid email address.');
    }
  }
}
