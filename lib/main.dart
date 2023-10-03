import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_downloader/app/Constants/app_color.dart';
import 'package:image_downloader/app/Constants/app_fonts.dart';
import 'package:image_downloader/app/Constants/app_strings.dart';
import 'package:image_downloader/app/Routes/app_pages.dart';
import 'package:image_downloader/app/utils/app_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) async {
    runApp(const MyApp());
  });
}

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(systemNavigationBarColor: AppColors.WHITE_COLOR, systemNavigationBarIconBrightness: Brightness.dark, statusBarIconBrightness: Brightness.dark, statusBarColor: AppColors.TRANSPARENT, statusBarBrightness: Brightness.light));
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await setSize(MediaQuery.sizeOf(context));
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.WHITE_COLOR,
        fontFamily: AppFonts.appFontFamily,
        primaryColor: AppColors.PRIMARY_COLOR,
        useMaterial3: true,
      ),
      initialRoute: Routes.splashScreen,
      defaultTransition: Transition.downToUp,
      onGenerateRoute: AppPages().generateRoute,
      home: Container(),
    );
  }
}
