
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nxl_task/app/palette.dart';

import 'app_font_weight.dart';
import 'app_text_style.dart';

class AppColors {
  static const linearTop = Color(0xFF1F2728);
  static const linearBottom = Color(0xFF222926);
  static const linearMiddle = Color(0xFF222325);
  static const linearMiddle2 = Color(0xFF7e7f7e);
  static const navBarBg = Color(0xFF2C3031);

  // static const primary = Color(0xFF01BFA3);
  static const primary = Color(0xFFAF3DA5);
  static const primary2 = Color(0xFF108258);
  static const primary2Dark = Color(0xFF108258);

  // static const primaryAccent = Color(0xFF24b24c);
  static const primaryAccent = Color(0xFF1F2728);

  static const violet1 = Color(0xFF712098);
  static const violet2 = Color(0xFF471163);

  static const orange1 = Color(0xFFb96233);
  static const orange2 = Color(0xFF9c4e25);

  static const primaryBlend = Color(0xFF006B8F);
  static const primaryBlend2 = Color(0xFF8C7A41);

  static const gray1 = Color(0xFF404040);
  static const gray2 = Color(0xFF423F3F);
  static const grayBg = Color(0xFF39393B);
  static const gray3 = Color(0xFFDBDBDB);
  static const grayFont = Color(0xFFF1F1F1);
  static const grayFontDark = Color(0xFF999999);
  static const orange = Color(0xFFF14F03);

  // static const gray2 = Color(0xFFD0D0D0);
  static const gray4 = Color(0xFFECECEC);
  static const black1 = Color(0xFF0C0B0B);
  static const grayBorder = Color(0xFFD2D2D2);
  static const green1 = Color(0xFF53BBC2);
  static const green2 = Color(0xFF4AF1AB);
  static const green3 = Color(0xFF2A9548);
  static const green4 = Color(0xFFE5FFCC);
  static const green5 = Color(0xFF5E8E20);
  static const red = Color(0xFFEF4444);
  static const yellow = Color(0xFFF3CA40);
  static const yellow1 = Color(0xFFEDB72D);
  static const blueBorder = Color(0xFF034A75);
  static const blueAppBar = Color(0xFF1F2C37);
  static const maroonLite = Color(0xFFFFA3A3);
  static const lavender = Color(0xFFC2ADFF);
  static const blue1 = Color(0xFF4AA1F1);
  static const blue2 = Color(0xFFDDF3FF);

  static const greenLite = Color(0xFF8fd7cc);
  static const greenLite1 = Color(0xFFecfffc);
  static const greenAccent = Color(0xFF08aa91);
  static const greenText = Color(0xFF00a68c);
  static const green2Lite = Color(0xFF98c737);
  static const green2Accent = Color(0xFF99c936);
  static const blueLite = Color(0xFFf2fffd);
  static const blueLite1 = Color(0xFFecfffc);

  // static const gray = Color(0xFFc9c9c9);
  static const darkGreen = Color(0xFF102e2a);
  static const orange1Accent = Color(0xFFf7951e);
  static const orange1Lite = Color(0xFFffbb69);
  static const chartColor = Color(0xFFdaeaba);
  static const chartBg = Color(0xFFf9ffee);
  static const liteGray = Color(0xFFfcfcfc);

  ///diet plan
  static const orangeLite = Color(0xFFffe0bc);
  static const orangeAccent = Color(0xFFdc7801);
  static const navyLite = Color(0xFFe2edeb);
  static const navyAccent = Color(0xFF1fad95);
  static const pinkLite = Color(0xFFffe0ef);
  static const pinkAccent = Color(0xFFe0015f);
  static const green3Lite = Color(0xFFd9f1cf);
  static const green3Accent = Color(0xFF7d9e52);

  ///

  static const maroon = Color(0xFF8B1B36);

  static const navyDark2 = Color(0xFF2B2B2B);

  // static const yellow = Color(0xFFF5D07F);
  static const yellowDark = Color(0xFFD4A53F);
  static const green = Color(0xFF22C55E);

  static const gradient1 = Color(0xFFF3d48E);
  static const gradient2 = Color(0xFFE5EBED);
  static const gradient3 = Color(0xFFDF7E95);

  static const grayIcon = Color(0xFF848484);
  static const primaryLight = Color(0xFFF2F5F0);
  static const lightGray2 = Color(0xFFcfcfcf);
  static const lightGray3 = Color(0xfffaf8f8);

  static const black = Color(0xFF222222);

  // static const red = Color(0xFF222222);
  static const lightGray = Color(0xFF9B9B9B);
  static const darkGray = Color(0xFF979797);
  static const white = Color(0xFFFFFFFF);

  // static const orange = Color(0xFFFFBA49);
  static const background = Color(0xFFE5E5E5);
  static const backgroundLight = Color(0xFFF9F9F9);
  static const transparent = Color(0x00000000);
  static const success = Color(0xFF2AA952);

// static const green = Color(0xFF2AA952);

  ///chat related
  static const Color separatorColor = Color(0xff272c35);
  static const Color greyColor = Color(0xff8f8f8f);
  static const Color senderColor = Color(0xff2b343b);
  static const Color receiverColor = Color(0xff1e2225);
}

///Material Design typography
/*NAME         SIZE  WEIGHT  SPACING
headline1    96.0  light   -1.5
headline2    60.0  light   -0.5
headline3    48.0  regular  0.0
headline4    34.0  regular  0.25
headline5    24.0  regular  0.0
headline6    20.0  medium   0.15
subtitle1    16.0  regular  0.15
subtitle2    14.0  medium   0.1
body1        16.0  regular  0.5   (bodyText1)
body2        14.0  regular  0.25  (bodyText2)
button       14.0  medium   1.25
caption      12.0  regular  0.4
overLine     10.0  regular  1.5*/

/// Ref: Font Weights: https://api.flutter.dev/flutter/dart-ui/FontWeight-class.html
/// Ref: Font Weights for TextTheme: https://api.flutter.dev/flutter/material/TextTheme-class.html

/// [AppTheme] - A complete app theme, used for the entire app
///
/// It can be customized by using `ThemeData` widget or `copyWith` method at anytime later for specific widgets
class AppTheme {
  ThemeData get theme {
    return ThemeData(
        colorScheme: _colorScheme,
        scaffoldBackgroundColor: _scaffoldBackground,
        canvasColor: Palette.background,
        dialogBackgroundColor: Palette.white,
        appBarTheme: _appBarTheme,
        bottomNavigationBarTheme: _bottomNavigationBarTheme,
        textButtonTheme: _textButtonTheme,
        textSelectionTheme: _textSelectionTheme,
        elevatedButtonTheme: _elevatedButtonTheme,
        outlinedButtonTheme: _outlinedButtonTheme,
        textTheme: _textTheme,
        dialogTheme: _dialogTheme,
        tooltipTheme: _tooltipTheme,
        bottomSheetTheme: _bottomSheetTheme,
        tabBarTheme: _tabBarTheme,
        dividerTheme: _dividerTheme,
        inputDecorationTheme: _inputDecorationTheme,
        pageTransitionsTheme: _pageTransitionsTheme,
        progressIndicatorTheme: _progressIndicatorTheme,
        iconTheme: _iconTheme,
        checkboxTheme: _checkBoxTheme,
        drawerTheme: _drawerTheme,
        radioTheme: _radioTheme,
        popupMenuTheme: _popupMenuTheme,
        sliderTheme: _sliderTheme,
        listTileTheme: _listTileTheme,
        cardTheme: _cardTheme);
  }

  CardThemeData get _cardTheme {
    return const CardThemeData(color: Palette.white);
  }

  Color get _scaffoldBackground {
    return Palette.background;
  }

  ColorScheme get _colorScheme {
    return const ColorScheme.light(
      secondary: Palette.primary,
      background: Palette.background,
    );
  }

  TextTheme get _textTheme => textTheme;

  TextTheme get textTheme {
    return TextTheme(
      displayLarge:
          AppTextStyle().displayLarge.copyWith(color: Palette.black),
      displayMedium:
          AppTextStyle().displayMedium.copyWith(color: Palette.black),
      displaySmall:
          AppTextStyle().displaySmall.copyWith(color: Palette.black),
      headlineMedium:
          AppTextStyle().headlineMedium.copyWith(color: Palette.black),
      headlineSmall:
          AppTextStyle().headlineSmall.copyWith(color: Palette.black),
      titleLarge: AppTextStyle().titleLarge.copyWith(color: Palette.black),
      titleMedium: AppTextStyle().titleMedium.copyWith(color: Palette.black),
      titleSmall: AppTextStyle().titleSmall.copyWith(color: Palette.black),
      bodyLarge: AppTextStyle().bodyLarge.copyWith(color: Palette.black),
      bodyMedium: AppTextStyle().bodyMedium.copyWith(color: Palette.black),
      bodySmall: AppTextStyle().bodySmall.copyWith(color: Palette.black),
      labelLarge: AppTextStyle().labelLarge.copyWith(color: Palette.black),
      labelSmall: AppTextStyle().labelSmall.copyWith(color: Palette.black),
    );
  }

  AppBarTheme get _appBarTheme {
    return AppBarTheme(
      backgroundColor: Palette.primary,
      elevation: 0.0,
      centerTitle: false,
      iconTheme: const IconThemeData(color: Palette.black),
      titleTextStyle:
          AppTextStyle().titleMedium.copyWith(color: Palette.black),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }

  BottomNavigationBarThemeData get _bottomNavigationBarTheme {
    return const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Palette.white,
      selectedItemColor: Palette.black,
      unselectedItemColor: Palette.fontDarkSecondary,
      selectedIconTheme: IconThemeData(
        color: Palette.black,
      ),
      unselectedIconTheme: IconThemeData(
        color: Palette.fontDarkSecondary,
      ),
    );
  }

  TextButtonThemeData get _textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Palette.secondary,
        textStyle: AppTextStyle()
            .headlineMedium
            .copyWith(fontWeight: AppFontWeight.extraBold),
      ),
    );
  }

  TextSelectionThemeData get _textSelectionTheme {
    return const TextSelectionThemeData(
      cursorColor: Palette.labelColor,
      selectionColor: Palette.labelColor,
      selectionHandleColor: Palette.labelColor,
    );
  }

  OutlinedButtonThemeData get _outlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        side: const BorderSide(color: Palette.white, width: 2),
        padding:  EdgeInsets.symmetric(vertical: 16),
        foregroundColor: Palette.white,
        minimumSize: const Size(208, 54),
      ),
    );
  }

  ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        backgroundColor: Palette.black,
        textStyle: AppTextStyle().labelMedium.copyWith(color: Palette.white),
      ),
    );
  }

  DialogThemeData get _dialogTheme {
    return DialogThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      backgroundColor: Palette.darkBackground,
      titleTextStyle: AppTextStyle().titleMedium,
      contentTextStyle: AppTextStyle().bodyLarge,
    );
  }

  TooltipThemeData get _tooltipTheme {
    return const TooltipThemeData(
      decoration: BoxDecoration(
        color: Palette.black,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      padding: EdgeInsets.all(10),
      textStyle: TextStyle(color: Palette.white),
    );
  }

  TabBarThemeData get _tabBarTheme {
    return TabBarThemeData(
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(
          width: 5.0,
          color: Palette.black,
        ),
      ),
      overlayColor: WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.pressed)) {
            return Palette.white.withOpacity(0.5); // Pressed state
          }
          if (states.contains(WidgetState.hovered)) {
            return Palette.borderGary; // Hovered state
          }
          if (states.contains(WidgetState.focused)) {
            return Palette.borderGary; // Focused state
          }
          return null; // Default state (no overlay)
        },
      ),
      labelColor: Palette.black,
      unselectedLabelColor: Palette.black,
      indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: AppTextStyle()
          .labelLarge
          .copyWith(fontWeight: AppFontWeight.semiBold),
      unselectedLabelStyle: AppTextStyle()
          .bodyMedium
          .copyWith(fontWeight: AppFontWeight.semiBold),
    );
  }

  DividerThemeData get _dividerTheme {
    return const DividerThemeData(
      space: 0,
      thickness: 0.5,
      color: Palette.grey,
    );
  }

  BottomSheetThemeData get _bottomSheetTheme {
    return const BottomSheetThemeData(
      backgroundColor: Palette.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
    );
  }

  InputDecorationTheme get _inputDecorationTheme {
    return InputDecorationTheme(
      filled: true,
      fillColor: Palette.white,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      border: InputBorder.none,
      labelStyle: AppTextStyle().bodySmall.copyWith(color: Palette.grey),
      hintStyle: AppTextStyle().bodySmall.copyWith(color: Palette.grey),
    );
  }

  PageTransitionsTheme get _pageTransitionsTheme {
    return const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
      },
    );
  }

  ProgressIndicatorThemeData get _progressIndicatorTheme {
    return const ProgressIndicatorThemeData(
      circularTrackColor: Colors.red,
    );
  }

  IconThemeData get _iconTheme {
    return const IconThemeData(color: Palette.black);
  }

  CheckboxThemeData get _checkBoxTheme {
    return CheckboxThemeData(
      checkColor: MaterialStateProperty.all(Palette.black),
      fillColor: MaterialStateProperty.all(Palette.transparent),
      // side: const BorderSide(color: Palette.black),
      side: MaterialStateBorderSide.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return const BorderSide(color: Palette.black);
        } else {
          return const BorderSide(color: Palette.black);
        }
      }),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }

  DrawerThemeData get _drawerTheme {
    return const DrawerThemeData(
      backgroundColor: Palette.darkGrey,
    );
  }

  RadioThemeData get _radioTheme {
    return RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith(
          (states) => Palette.black,
        ),
        overlayColor: MaterialStateProperty.resolveWith(
          (states) => Palette.black,
        ));
  }

  PopupMenuThemeData get _popupMenuTheme {
    return PopupMenuThemeData(
      color: Palette.white,
      textStyle: AppTextStyle().bodyMedium,
    );
  }

  SliderThemeData get _sliderTheme {
    return const SliderThemeData(
      thumbColor: Palette.secondary,
      activeTrackColor: Palette.secondary,
      inactiveTrackColor: Palette.lightGrey,
    );
  }

  ListTileThemeData get _listTileTheme {
    return const ListTileThemeData(iconColor: Palette.black);
  }
}

/// Dark Mode App [ThemeData].
class AppDarkTheme {
  ThemeData get theme {
    return ThemeData(
        colorScheme: _colorScheme,
        scaffoldBackgroundColor: Palette.darkBackground,
        canvasColor: Palette.darkBackground,
        dialogBackgroundColor: Palette.white,
        appBarTheme: _appBarTheme,
        bottomNavigationBarTheme: _bottomNavigationBarTheme,
        textButtonTheme: _textButtonTheme,
        textSelectionTheme: _textSelectionTheme,
        elevatedButtonTheme: _elevatedButtonTheme,
        outlinedButtonTheme: _outlinedButtonTheme,
        textTheme: _textTheme,
        dialogTheme: _dialogTheme,
        tooltipTheme: _tooltipTheme,
        bottomSheetTheme: _bottomSheetTheme,
        tabBarTheme: _tabBarTheme,
        dividerTheme: _dividerTheme,
        inputDecorationTheme: _inputDecorationTheme,
        pageTransitionsTheme: _pageTransitionsTheme,
        progressIndicatorTheme: _progressIndicatorTheme,
        iconTheme: _iconTheme,
        checkboxTheme: _checkBoxTheme,
        drawerTheme: _drawerTheme,
        radioTheme: _radioTheme,
        popupMenuTheme: _popupMenuTheme,
        sliderTheme: _sliderTheme,
        listTileTheme: _listTileTheme,
        cardTheme: _cardTheme);
  }

  CardThemeData get _cardTheme {
    return const CardThemeData(
        color: Palette.white, shadowColor: Palette.white);
  }

  ColorScheme get _colorScheme {
    return const ColorScheme.dark(
      secondary: Palette.primary,
      background: Palette.background,
    );
  }

  TextTheme get _textTheme => textTheme;

  static TextTheme get textTheme {
    return TextTheme(
      displayLarge:
          AppTextStyle().displayLarge.copyWith(color: Palette.fontLight),
      displayMedium:
          AppTextStyle().displayMedium.copyWith(color: Palette.fontLight),
      displaySmall:
          AppTextStyle().displaySmall.copyWith(color: Palette.fontLight),
      headlineMedium:
          AppTextStyle().headlineMedium.copyWith(color: Palette.fontLight),
      headlineSmall:
          AppTextStyle().headlineSmall.copyWith(color: Palette.fontLight),
      titleLarge: AppTextStyle().titleLarge.copyWith(color: Palette.fontLight),
      titleMedium:
          AppTextStyle().titleMedium.copyWith(color: Palette.fontLight),
      titleSmall: AppTextStyle().titleSmall.copyWith(color: Palette.fontLight),
      bodyLarge: AppTextStyle().bodyLarge.copyWith(color: Palette.fontLight),
      bodyMedium: AppTextStyle().bodyMedium.copyWith(color: Palette.fontLight),
      bodySmall: AppTextStyle().bodySmall.copyWith(color: Palette.fontLight),
      labelLarge: AppTextStyle().labelLarge.copyWith(color: Palette.fontLight),
      labelSmall: AppTextStyle().labelSmall.copyWith(color: Palette.fontLight),
    );
  }

  AppBarTheme get _appBarTheme {
    return AppBarTheme(
      backgroundColor: Palette.linearTop,
      elevation: 0.0,
      centerTitle: false,
      iconTheme: const IconThemeData(color: Palette.white),
      titleTextStyle: AppTextStyle().titleMedium.copyWith(
            color: Palette.fontLight,
          ),
      systemOverlayStyle: SystemUiOverlayStyle.light,
    );
  }

  BottomNavigationBarThemeData get _bottomNavigationBarTheme {
    return const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Palette.background,
      selectedItemColor: Palette.white,
      unselectedItemColor: Palette.grey,
      selectedIconTheme: IconThemeData(
        color: Palette.white,
      ),
      unselectedIconTheme: IconThemeData(
        color: Palette.grey,
      ),
    );
  }

  TextButtonThemeData get _textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Palette.secondary,
        textStyle: AppTextStyle()
            .headlineMedium
            .copyWith(fontWeight: AppFontWeight.extraBold),
      ),
    );
  }

  TextSelectionThemeData get _textSelectionTheme {
    return const TextSelectionThemeData(
      cursorColor: Palette.primary,
      selectionColor: Palette.primary,
      selectionHandleColor: Palette.primary,
    );
  }

  OutlinedButtonThemeData get _outlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        side: const BorderSide(color: Palette.white, width: 2),
        padding: const EdgeInsets.symmetric(vertical: 16),
        foregroundColor: Palette.white,
        minimumSize: const Size(208, 54),
      ),
    );
  }

  ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        backgroundColor: Palette.black,
        textStyle: AppTextStyle().labelMedium.copyWith(color: Palette.white),
      ),
    );
  }

  DialogThemeData get _dialogTheme {
    return DialogThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      backgroundColor: Palette.darkBackground,
      titleTextStyle: AppTextStyle().titleMedium,
      contentTextStyle: AppTextStyle().bodyLarge,
    );
  }

  TooltipThemeData get _tooltipTheme {
    return const TooltipThemeData(
      decoration: BoxDecoration(
        color: Palette.black,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      padding: EdgeInsets.all(10),
      textStyle: TextStyle(color: Palette.darkBackgroundSecondary),
    );
  }

  TabBarThemeData get _tabBarTheme {
    return TabBarThemeData(
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(
          width: 5.0,
          color: Palette.secondary,
        ),
      ),
      labelColor: Palette.white,
      unselectedLabelColor: Palette.white,
      indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: AppTextStyle()
          .bodyMedium
          .copyWith(fontWeight: AppFontWeight.semiBold),
      unselectedLabelStyle: AppTextStyle()
          .bodyMedium
          .copyWith(fontWeight: AppFontWeight.semiBold),
    );
  }

  DividerThemeData get _dividerTheme {
    return const DividerThemeData(
      space: 0,
      thickness: 0.5,
      color: Palette.grey,
    );
  }

  BottomSheetThemeData get _bottomSheetTheme {
    return const BottomSheetThemeData(
      backgroundColor: Palette.darkBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
    );
  }

  InputDecorationTheme get _inputDecorationTheme {
    return InputDecorationTheme(
      filled: true,
      // fillColor: AppColors.grayBg,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      border: InputBorder.none,
      labelStyle: AppTextStyle().bodySmall.copyWith(color: Palette.grey),
      hintStyle: AppTextStyle().bodySmall.copyWith(color: Palette.grey),
    );
  }

  PageTransitionsTheme get _pageTransitionsTheme {
    return const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
      },
    );
  }

  ProgressIndicatorThemeData get _progressIndicatorTheme {
    return const ProgressIndicatorThemeData(
        // circularTrackColor: Palette.yellowGradientBottom,
        );
  }

  IconThemeData get _iconTheme {
    return const IconThemeData(color: Palette.white);
  }

  CheckboxThemeData get _checkBoxTheme {
    return CheckboxThemeData(
      checkColor: MaterialStateProperty.all(Palette.white),
      fillColor: MaterialStateProperty.all(Palette.transparent),
      // side: const BorderSide(color: Palette.black),
      side: MaterialStateBorderSide.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return const BorderSide(color: Palette.white);
        } else {
          return const BorderSide(color: Palette.white);
        }
      }),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }

  DrawerThemeData get _drawerTheme {
    return const DrawerThemeData(
      backgroundColor: Palette.darkGrey,
    );
  }

  RadioThemeData get _radioTheme {
    return RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith(
          (states) => Palette.primary2Dark,
        ),
        overlayColor: MaterialStateProperty.resolveWith(
          (states) => Palette.primary2Dark,
        ));
  }

  PopupMenuThemeData get _popupMenuTheme {
    return PopupMenuThemeData(
      color: Palette.white,
      textStyle: AppTextStyle().bodyMedium,
    );
  }

  SliderThemeData get _sliderTheme {
    return const SliderThemeData(
      thumbColor: Palette.secondary,
      activeTrackColor: Palette.secondary,
      inactiveTrackColor: Palette.lightGrey,
    );
  }

  ListTileThemeData get _listTileTheme {
    return const ListTileThemeData(iconColor: Palette.white);
  }
}
