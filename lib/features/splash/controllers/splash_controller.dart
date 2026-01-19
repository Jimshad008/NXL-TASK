
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../app/app_router.dart';
import '../../../app/providers.dart';
import '../../../util/navigation_service.dart';

part 'splash_controller.g.dart';

@riverpod
class SplashController extends _$SplashController {
  @override
  AsyncValue build() {
    initialize();
    return const AsyncValue.loading();
  }

  void initialize() {
    state = const AsyncValue.loading();
    final prefStorageService = ref.read(preferenceStorageProvider);
    // ref.read(preferenceStorageProvider).loggedIn = true;
    Future.delayed(const Duration(seconds: 3), () async {
      if (prefStorageService.loggedIn) {
        NavigationService.pushReplacementAll(
          page: AppRouter.home,
        );
      }
      else {
        NavigationService.pushReplacementAll(
          page: AppRouter.login,
        );
      }

      state = const AsyncValue.data(true);
    });
  }
}
