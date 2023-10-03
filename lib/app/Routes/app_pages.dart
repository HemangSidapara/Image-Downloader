import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_downloader/app/Screens/image_downloader_screen/image_downloader_view.dart';
import 'package:image_downloader/app/Screens/splash_screen/splash_view.dart';

part 'app_routes.dart';

Duration transitionDuration = const Duration(milliseconds: 400);

class AppPages {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return GetPageRoute(
          routeName: settings.name,
          page: () => const SplashView(),
          transition: Transition.rightToLeft,
          transitionDuration: transitionDuration,
        );
      case Routes.imageDownloaderScreen:
        return GetPageRoute(
          routeName: settings.name,
          page: () => const ImageDownloaderView(),
          transition: Transition.rightToLeft,
          transitionDuration: transitionDuration,
        );

      default:
        return GetPageRoute(
          page: () => Scaffold(
            body: Center(
              child: Text('No path for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
