
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nxl_task/features/auth/view/login_page.dart';
import 'package:nxl_task/features/home/view/home_page.dart';
import 'package:nxl_task/features/auth/view/forgot_password_page.dart';
import 'package:nxl_task/features/splash/view/signup_page.dart';
import '../features/auth/view/splash_page.dart';



/// [AppRouter] - A view router class which holds all the routes used in the app
/// It can be used to navigating routes using `pushNamed` method of `Navigator` class
class AppRouter {
  AppRouter._();

  static const splash = '/splash';
  static const login = '/login';
  static const register = '/register';
  static const home = '/home';
  static const forgotPassword = '/forgotPassword';








  // static const register = '/register';
  // static const otpVerification = '/otp_verification';
  // static const forgotPassword = '/forgot_password';
  // static const onBoarding = '/on_boarding';
  // static const notificationsPage = '/notifications_page';
  // static const profilePage = '/profile_page';
  // static const themePage = '/theme_page';
  // static const myOrders = '/my_orders';
  // static const subscription = '/subscription';
  // static const contactUsPage = '/contactUsPage';
  //
  //
  // static const addIncident = '/addIncident';
  // static const listIncident = '/listIncident';
  // static const userProfile = '/userProfile';
  // static const userSupport = '/userSupport';
  // static const aboutPage = '/aboutPage';
  // static const deleteProfile = '/deleteProfile';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return getMaterialRoute(const SplashPage());
      case login:
        return getMaterialRoute(const LoginPage());
      case forgotPassword:
        return getMaterialRoute(const ForgotPasswordPage());
      case register:
        return getMaterialRoute(const SignupPage());
      case home:
        return getMaterialRoute(const HomePage());
      // case notificationsPage:
      //   return getMaterialRoute(const NotificationsPage());
      // case userProfile:
      //   return getMaterialRoute(const UserProfile());
      // case userSupport:
      //   return getMaterialRoute(const UserSupport());
      // case aboutPage:
      //   return getMaterialRoute(const AboutPage());
      // case deleteProfile:
      //   return getMaterialRoute(const DeletePage());

      default:
        return getMaterialRoute(
          Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  static MaterialPageRoute getMaterialRoute(Widget child) {
    return MaterialPageRoute(
      builder: (_) => child,
    );
  }static CupertinoPageRoute getCupertinoRoute(Widget child) {
    return CupertinoPageRoute(
      builder: (_) => child,
    );
  }
}
