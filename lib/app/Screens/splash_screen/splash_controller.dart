import 'package:get/get.dart';
import 'package:image_downloader/app/Routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    super.onInit();

    await Future.delayed(
      const Duration(seconds: 1),
      () {
        Get.offAllNamed(Routes.imageDownloaderScreen);
      },
    );
  }
}
