
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../app/app_text_style.dart';
import '../../../constants/assets.dart';
import '../../../util/alert.dart';
import '../../../util/ui_helper.dart';
import '../../splash/controllers/splash_controller.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> with SingleTickerProviderStateMixin {
  bool isLoading = true;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _controller.forward();
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue>(
        splashControllerProvider, (_, state) => _handleSplashState(state));

    return Scaffold(
        body:Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              horizontalSpaceSX,
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: ScaleTransition(
                      scale: _scaleAnimation,
                      child: Column(
                        children: [

                          SizedBox(
                            width: getWidth(context: context)*0.6,
                            height: 60.h,
                            child: Image.asset(
                              Assets.appLogo,
                              fit: BoxFit.contain,
                            ),
                          ),

                          // verticalSpaceMedium,
                          // isLoading ? const CupertinoActivityIndicator(color: Colors.black,) : Container()
                        ],
                      ),
                    ),
                  ),

                  verticalSpaceLarge,
                  isLoading ? Column(
                    children: [
                      const CupertinoActivityIndicator(color: Colors.white,),
                    ],
                  ) : Container()
                ],
              ),

            ],
          ),
        ));
  }

  _handleSplashState(AsyncValue state) {
    if (state is AsyncData) {
      final bool isLoggedIn =
          state.whenOrNull(data: (loggedInStatus) => loggedInStatus)!;
      isLoading = false;
      setState(() {});
      // NavigationService.pushReplacementAll(
      //   page: isLoggedIn ? AppRouter.login : AppRouter.login,
      // );
    } else if (state is AsyncError) {
      Alert.showToast(state.error.toString());
    }
  }
}
