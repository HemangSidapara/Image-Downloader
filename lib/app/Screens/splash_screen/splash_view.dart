import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_downloader/app/Screens/splash_screen/splash_controller.dart';
import 'package:image_downloader/app/utils/app_sizer.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedIcon(
          icon: AnimatedIcons.play_pause,
          progress: kAlwaysDismissedAnimation,
          size: 20.w,
          color: Colors.blue,
        ),
      ),
    );
  }
}
