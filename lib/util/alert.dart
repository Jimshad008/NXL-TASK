
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../app/palette.dart';
import '../app/theme.dart';

/// [Alert] - A simple alert utility for showing `Android's` style `Toast` message
///
/// It can be used in any situations like exception, invalid inputs etc
class Alert {
  Alert._();

  static void showErrorToast(String text,
      {bool isLong = true, ToastGravity gravity = ToastGravity.TOP}) {
    Fluttertoast.showToast(
      msg: text,
      textColor: Colors.white,
      backgroundColor: Colors.red,
      toastLength: isLong ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
      gravity: gravity,
    );
  }

  static void showToast(String text,
      {bool isLong = true, ToastGravity gravity = ToastGravity.BOTTOM}) {
    Fluttertoast.showToast(
      fontSize: 16.sp,
      msg: text,
      textColor: Colors.white,
      backgroundColor: AppColors.primary,
      toastLength: isLong ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
      gravity: gravity,
    );
  }
}
