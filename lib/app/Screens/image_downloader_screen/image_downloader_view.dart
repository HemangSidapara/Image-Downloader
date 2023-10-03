import 'dart:convert';
import 'dart:html' as HTML;
import 'dart:typed_data';

import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_downloader/app/Constants/app_color.dart';
import 'package:image_downloader/app/utils/app_formatter.dart';
import 'package:image_downloader/app/utils/app_sizer.dart';

class ImageDownloaderView extends StatefulWidget {
  const ImageDownloaderView({super.key});

  @override
  State<ImageDownloaderView> createState() => _ImageDownloaderViewState();
}

class _ImageDownloaderViewState extends State<ImageDownloaderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/Icon-512.png'),
        leadingWidth: 20.w,
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.black54,
            width: 2,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        title: Text(
          'Mindwave Infoway\'s Image Downloader',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 7.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () async {
                FilePickerResult? result = await FilePickerWeb.platform.pickFiles();

                if (result != null) {
                  Uint8List? txtFileBytes = result.files.single.bytes;

                  List<String> imageUrlList = LineSplitter.split(const Utf8Decoder().convert(txtFileBytes!)).toList();
                  final totalLoops = (imageUrlList.length / 10).floor();
                  final moduloUpper = (imageUrlList.length / 10).toString().split('.').last.toInt();
                  for (int k = 1; k <= totalLoops; k++) {
                    for (int i = (k - 1) * 10; i < k * 10; i++) {
                      final response = await HTML.window.fetch(imageUrlList[i], {'method': 'GET'});
                      var downloadUrl = HTML.Url.createObjectUrlFromBlob(await response.blob());
                      HTML.AnchorElement(href: downloadUrl)
                        ..setAttribute('download', imageUrlList[i].split('?X-Amz-Content-Sha256').first.split('/').last)
                        ..click();
                    }
                    await Future.delayed(const Duration(seconds: 1));
                  }
                  for (int l = 0; l < moduloUpper; l++) {
                    final response = await HTML.window.fetch(imageUrlList[totalLoops * 10 + l], {'method': 'GET'});
                    var downloadUrl = HTML.Url.createObjectUrlFromBlob(await response.blob());
                    HTML.AnchorElement(href: downloadUrl)
                      ..setAttribute('download', imageUrlList[totalLoops * 10 + l].split('?X-Amz-Content-Sha256').first.split('/').last)
                      ..click();
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                side: const BorderSide(
                  color: Colors.blueGrey,
                  width: 2,
                ),
                backgroundColor: AppColors.WHITE_COLOR,
                surfaceTintColor: AppColors.WHITE_COLOR,
              ),
              child: Text(
                '+ select urls file',
                style: TextStyle(
                  fontSize: 5.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.blueGrey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
