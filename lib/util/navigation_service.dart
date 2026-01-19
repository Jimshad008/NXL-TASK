import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final navigationProvider =
    Provider<NavigationService>((_) => NavigationService());

/// [NavigationService] - A navigation service class used for navigating the routes and used
/// for replacing the existing routes, popping the routes.
///
/// `navigationKey` - A global key is assigned in the root ef the material app before using the
/// `navigationProvider`
class NavigationService {
  static final _navigationKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  static removeAllFocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static Future<dynamic> push({
    bool isNamed = true,
    required dynamic page,
    dynamic arguments,
    bool preventDuplicates = true,
  }) async {
    removeAllFocus();
    if (isNamed) {
      if (preventDuplicates) {
        final isDuplicate = checkDuplicateRoute(page, arguments);
        if (isDuplicate) return;
      }
      return await _navigationKey.currentState!
          .pushNamed(page, arguments: arguments);
    } else {
      return await _navigationKey.currentState!.push(
        platformPageRoute(builder: (context) => page),
      );
    }
  }

  static Future<dynamic> pushReplacement({
    bool isNamed = true,
    required dynamic page,
    dynamic arguments,
    bool preventDuplicates = true,
    bool rootNavigator = false,
  }) async {
    removeAllFocus();

    if (isNamed) {
      if (preventDuplicates) {
        final isDuplicate = checkDuplicateRoute(page, arguments);
        if (isDuplicate) return;
      }
      return await _navigationKey.currentState!
          .pushReplacementNamed(page, arguments: arguments);
    } else {
      return await _navigationKey.currentState!.pushReplacement(page);
    }
  }

  static Future<dynamic> pop<T>({
    T? result,
    bool maybePop = false,
  }) async {
    removeAllFocus();
    if (maybePop) {
      return await _navigationKey.currentState!.maybePop(result);
    } else {
      _navigationKey.currentState!.pop(result);
    }
  }

  static popUntil({
    required RoutePredicate predicate,
  }) {
    removeAllFocus();
    _navigationKey.currentState!.popUntil(predicate);
  }

  static Future<T?>? pushReplacementAll<T>({
    bool isNamed = true,
    required dynamic page,
    dynamic arguments,
  }) async {
    removeAllFocus();
    if (isNamed) {
      return await _navigationKey.currentState!.pushNamedAndRemoveUntil(
        page,
        (route) => false,
        arguments: arguments,
      );
    } else {
      return await _navigationKey.currentState!
          .pushAndRemoveUntil(page, (route) => false);
    }
  }

  static Future<T?>? pushAndRemoveUntil<T>({
    bool isNamed = true,
    required dynamic page,
    required bool Function(Route<dynamic>) predicate,
    dynamic arguments,
    bool closeOverlays = false,
    bool rootNavigator = false,
  }) async {
    removeAllFocus();
    if (isNamed) {
      return await _navigationKey.currentState!
          .pushNamedAndRemoveUntil(page, predicate, arguments: arguments);
    } else {
      return await _navigationKey.currentState!
          .pushAndRemoveUntil(page, predicate);
    }
  }

  static bool checkDuplicateRoute(
    String page,
    dynamic arguments,
  ) {
    bool isNewRouteSameAsCurrent = false;
    _navigationKey.currentState!.popUntil(
      (route) {
        if (route.settings.name == page &&
            route.settings.arguments == arguments) {
          isNewRouteSameAsCurrent = true;
        }
        return true;
      },
    );
    return isNewRouteSameAsCurrent;
  }
}

PageRoute<T> platformPageRoute<T>({
  required WidgetBuilder builder,
  RouteSettings? settings,
  bool maintainState = true,
  bool fullscreenDialog = false,
  String? iosTitle,
}) {
  if (Platform.isAndroid) {
    return MaterialPageRoute<T>(
      builder: builder,
      settings: settings,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
    );
  } else {
    return CupertinoPageRoute<T>(
      builder: builder,
      title: iosTitle,
      settings: settings,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
    );
  }
}
