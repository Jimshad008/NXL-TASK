import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nxl_task/app/app_text_style.dart';
import 'package:nxl_task/util/custom_alert_dialog.dart';
import 'package:nxl_task/util/ui_helper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user=FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      children: [
       SizedBox(
         width: getWidth(context: context)*0.9,
           child: Center(child: Text("Hi ${user?.displayName??" "}👋",style: AppTextStyle().titleLarge,))),
       SizedBox(
         width: getWidth(context: context)*0.9,
           child: Center(child: Text(user?.email??"",style: AppTextStyle().titleLarge,))),
        verticalSpaceLarge,
        Consumer(
          builder: (context,ref,child) {
            return IconButton(onPressed: () {
             showLogoutAlert(context, ref);
            }, icon: Icon(Icons.logout,size: 25.sp,color: Colors.white,));
          }
        )
      ]),
    );
  }
}
