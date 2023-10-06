import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_downloader/app/Constants/app_color.dart';

class ProgressDialog {
  static var isOpen = false;

  static showProgressDialog(bool showDialog) {
    if (showDialog) {
      isOpen = true;
      if (kDebugMode) {
        print('|--------------->🕙️ Loader start 🕑️<---------------|');
      }

      Get.dialog(
        WillPopScope(
          onWillPop: () => Future.value(true),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                color: AppColors.SUCCESS_COLOR,
              )
            ],
          ),
        ),
        barrierDismissible: false, /*useRootNavigator: false*/
      );
    } else if (Get.isDialogOpen == true) {
      if (kDebugMode) {
        print('|--------------->🕙️ Loader end 🕑️<---------------|');
      }
      Get.back();
      isOpen = false;
    }
  }
}
