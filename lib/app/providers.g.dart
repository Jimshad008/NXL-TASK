// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$preferenceStorageHash() => r'697cbab3e4103812ebb1feffa49dd74b3e9563f5';

/// See also [preferenceStorage].
@ProviderFor(preferenceStorage)
final preferenceStorageProvider =
    AutoDisposeProvider<PreferenceStorageService>.internal(
      preferenceStorage,
      name: r'preferenceStorageProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$preferenceStorageHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PreferenceStorageRef = AutoDisposeProviderRef<PreferenceStorageService>;
String _$appThemeModeHash() => r'33108ee4da223f84996a6fcc03a99c127135b9fb';

/// See also [AppThemeMode].
@ProviderFor(AppThemeMode)
final appThemeModeProvider =
    AutoDisposeNotifierProvider<AppThemeMode, ThemeMode>.internal(
      AppThemeMode.new,
      name: r'appThemeModeProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$appThemeModeHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AppThemeMode = AutoDisposeNotifier<ThemeMode>;
String _$darkAppThemeModeHash() => r'43eadee3b760843a0c887fff6da71f4c583143e8';

/// See also [DarkAppThemeMode].
@ProviderFor(DarkAppThemeMode)
final darkAppThemeModeProvider =
    AutoDisposeNotifierProvider<DarkAppThemeMode, bool>.internal(
      DarkAppThemeMode.new,
      name: r'darkAppThemeModeProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$darkAppThemeModeHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$DarkAppThemeMode = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
