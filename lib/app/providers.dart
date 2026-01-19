
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/storage/preference_storage_service.dart';

part 'providers.g.dart';

@riverpod
PreferenceStorageService preferenceStorage(PreferenceStorageRef ref) =>
    throw UnimplementedError();



@riverpod
class AppThemeMode extends _$AppThemeMode {
  @override
  ThemeMode build() {
    final appThemeIndex = ref.watch(preferenceStorageProvider).theme;
    switch (appThemeIndex) {
      case 1:
        return ThemeMode.light;
      case 2:
        return ThemeMode.dark;
      default:
        final brightness =
            SchedulerBinding.instance.platformDispatcher.platformBrightness;
        final isDark = brightness == Brightness.dark;
        return isDark ? ThemeMode.dark : ThemeMode.light;
    }
  }
}

@riverpod
class DarkAppThemeMode extends _$DarkAppThemeMode {
  @override
  bool build() {
    final appThemeMode = ref.watch(appThemeModeProvider);
    return appThemeMode == ThemeMode.dark;
  }
}
