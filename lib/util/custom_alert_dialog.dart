import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nxl_task/app/app_router.dart';
import 'package:nxl_task/app/providers.dart';
import 'package:nxl_task/util/gradient_iems.dart';
import 'package:nxl_task/util/ui_helper.dart';
import '../app/app_text_style.dart';
import '../app/palette.dart';
import '../app/theme.dart';
import '../widgets/custom_elevated_button.dart';
import 'navigation_service.dart';


void showLogoutAlert(BuildContext context, WidgetRef ref,) {
 return showCustomAlertWithButton(context: context,

      title:'Logout',
      content:"Are you sure you want to log out of the application?",
   buttonPositiveLabel: 'Yes',buttonNegativeLabel:'No',onPositiveButtonPressed:() async {
     ref.read(preferenceStorageProvider).loggedIn = false;
     FirebaseAuth.instance.signOut();
     NavigationService.pushReplacementAll(page: AppRouter.login);
      },onNegativeButtonPressed:  () => NavigationService.pop(),  );

}



void  showCustomAlertWithButton({  VoidCallback? onPositiveButtonPressed,VoidCallback? onNegativeButtonPressed,String? buttonPositiveLabel,String? buttonNegativeLabel,required BuildContext context,required String title,required String content}){
   showDialog(
     barrierDismissible: false,
    context: context,
     // barrierColor: Colors.black.withOpacity(0.8),
    builder: (BuildContext context) {
      return PopScope(
        canPop: false,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: AlertDialog(elevation: 10,
            shadowColor: Colors.black,

            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            contentPadding: EdgeInsets.all(4.sp),

            backgroundColor: AppColors.white,
            content: Container(
              padding: EdgeInsets.symmetric(horizontal:8.sp ,vertical: 20.sp),
              width: getWidth(context: context)*0.95,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [

                  Text(textAlign: TextAlign.center,title,style: AppTextStyle().titleMedium.copyWith(color: Colors.black),),
                  verticalSpaceSmall,
                  SizedBox(
                      width: getWidth(context: context)*0.93,
                      child: Text(textAlign: TextAlign.center,content,style: AppTextStyle().bodySmall.copyWith(color: Colors.black),)),



                  Column(
                    children: [
                      verticalSpaceMedium,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          if(buttonPositiveLabel!=null)
                            CustomElevatedButton(
                                width: getWidth(context: context)*0.3,

                                labelTextStyle: AppTextStyle().bodyMedium.copyWith(color: Colors.white),
                                label: buttonPositiveLabel,
                                onPressed: onPositiveButtonPressed),
                          if(buttonNegativeLabel!=null)
                            GradientItems(
                              child: CustomElevatedButton(
                                  nosShadow: true,
                                  width: getWidth(context: context)*0.3,
                                  color: Colors.transparent,
                                  label: buttonNegativeLabel,
                                  labelTextStyle: AppTextStyle().bodyMedium.copyWith(color: Palette.white),
                                  borderSide: BorderSide(color: Palette.white),
                                  onPressed: onNegativeButtonPressed),
                            ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );




}
