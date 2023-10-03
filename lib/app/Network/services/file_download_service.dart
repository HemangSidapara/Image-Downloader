import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_downloader/app/Constants/app_color.dart';
import 'package:image_downloader/app/Constants/app_strings.dart';
import 'package:image_downloader/app/Constants/app_utils.dart';
import 'package:image_downloader/app/Network/ResponseModel.dart';
import 'package:image_downloader/app/utils/app_formatter.dart';
import 'package:image_downloader/app/utils/app_sizer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class FileDownloadService extends GetxService {
  final RxInt _downloadedPercentage = 0.obs;

  Future<ResponseModel?> fileDownload({required String fileUrl, required String fileName}) async {
    try {
      Get.dialog(
        Obx(() {
          return Material(
            color: AppColors.TRANSPARENT,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: AppColors.PRIMARY_COLOR,
                  value: _downloadedPercentage.value / 100,
                ),
                SizedBox(height: 1.h),
                Text(
                  '${_downloadedPercentage.value}%',
                  style: TextStyle(
                    color: AppColors.PRIMARY_COLOR,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          );
        }),
      );

      bool isGranted = false;
      if (!kIsWeb) {
        if (await Permission.storage.request().isGranted || await Permission.photos.request().isGranted) {
          isGranted = true;
        } else if (await Permission.storage.request().isPermanentlyDenied || await Permission.photos.request().isPermanentlyDenied) {
          await openAppSettings();
        } else if (await Permission.storage.request().isDenied || await Permission.photos.request().isDenied) {
          await Permission.storage.request();
        }
      } else {
        isGranted = true;
      }

      if (isGranted) {
        Directory? dirDownload;
        if (!kIsWeb) {
          if (Platform.isIOS) {
            dirDownload = await getApplicationDocumentsDirectory();
          }
        }

        final response = await Dio().download(
          fileUrl,
          !kIsWeb
              ? Platform.isIOS
                  ? '${dirDownload?.path}/${fileName.split('.')[0].replaceAll(':', '_')}_${UniqueKey().hashCode}.${fileName.split('.').last}'
                  : '/storage/emulated/0/Download/${fileName.split('.')[0].replaceAll(':', '_')}_${UniqueKey().hashCode}.${fileName.split('.').last}'
              : '${dirDownload?.path}/${fileName.split('.')[0].replaceAll(':', '_')}_${UniqueKey().hashCode}.${fileName.split('.').last}',
          onReceiveProgress: (received, total) {
            if (total != -1) {
              if (kDebugMode) {
                print("Downloaded % :: ${(received / total * 100).toStringAsFixed(0)}%");
              }
              _downloadedPercentage.value = (received / total * 100).toStringAsFixed(0).toInt();
            }
          },
        );
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          if (Get.isOverlaysOpen) {
            Get.back();
          }
          Utils.validationCheck(message: AppStrings.fileIsSavedToDownloadFolder);
        }
        return ResponseModel(response: response, statusCode: response.statusCode);
      } else {
        if (Get.isOverlaysOpen) {
          Get.back();
        }
        Utils.validationCheck(message: 'Permission denied.', isError: true);
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print('Error :: ${e.message}');
      }
      Get.back();
      Utils.validationCheck(message: 'Something went wrong.', isError: true);
    }
    return null;
  }
}
