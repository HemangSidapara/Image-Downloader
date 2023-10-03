import 'package:flutter/material.dart';
import 'package:image_downloader/app/Constants/app_color.dart';
import 'package:image_downloader/app/utils/app_sizer.dart';

class AppStyles {
  static TextStyle get welcomeHeadingTextStyle {
    return TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w900,
      color: AppColors.PRIMARY_COLOR,
    );
  }

  static TextStyle get welcomeHeading2ndTextStyle {
    return TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w900,
      color: AppColors.PRIMARY_LIGHT_BLUE_COLOR,
    );
  }

  static TextStyle get welcomeSubtitleTextStyle {
    return TextStyle(
      fontSize: 11.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.PRIMARY_COLOR,
    );
  }

  static TextStyle get headingTitleTextStyle {
    return TextStyle(
      fontSize: 19.sp,
      fontWeight: FontWeight.w900,
      color: AppColors.PRIMARY_LIGHT_BLUE_COLOR,
    );
  }

  static TextStyle get subTitleTextStyle {
    return TextStyle(
      fontSize: 19.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.PRIMARY_LIGHT_BLUE_COLOR,
    );
  }

  static TextStyle get headingTitleTextDarkStyle {
    return TextStyle(
      fontSize: 19.sp,
      fontWeight: FontWeight.w900,
      color: AppColors.WHITE_COLOR,
    );
  }

  static TextStyle get headingTitle2ndTextStyle {
    return TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w900, color: AppColors.DARK_BLACK_COLOR);
  }

  static TextStyle get headingTitle2ndTextDarkStyle {
    return TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w900, color: AppColors.VAPOR_WAVE_COLOR);
  }

  static TextStyle get headingSubTitleTextStyle {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 11.sp,
    );
  }

  static TextStyle get headingSubTitleTextDarkStyle {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 11.sp,
      color: AppColors.WHITE_COLOR,
    );
  }

  static TextStyle get otherSignInTextStyle {
    return TextStyle(fontWeight: FontWeight.w500, fontSize: 11.sp, color: AppColors.LIGHT_BLACK_COLOR);
  }

  static TextStyle get wizardsStepsTextStyle {
    return TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w600, color: AppColors.WHITE_COLOR);
  }

  static TextStyle get wizardsTitleTextStyle {
    return TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w900, color: AppColors.WHITE_COLOR);
  }

  static TextStyle get planPriceTextStyle {
    return TextStyle(
      color: AppColors.WHITE_COLOR,
      fontSize: 18.sp,
      fontWeight: FontWeight.w900,
    );
  }

  static TextStyle get planValidityTextStyle {
    return TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.WHITE_COLOR,
    );
  }

  static TextStyle get planTextStyle {
    return TextStyle(
      color: AppColors.WHITE_COLOR,
      fontSize: 12.sp,
      fontWeight: FontWeight.w900,
    );
  }

  static TextStyle get planBlackTextStyle {
    return TextStyle(
      color: AppColors.BLACK_COLOR,
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle get planBlackTextSmallStyle {
    return TextStyle(
      color: AppColors.BLACK_COLOR,
      fontSize: 9.sp,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle get planWhiteTextSmallStyle {
    return TextStyle(
      color: AppColors.WHITE_COLOR,
      fontSize: 9.sp,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle get planWhiteTextStyle {
    return TextStyle(
      color: AppColors.HINT_COLOR,
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle get selectedTabTextStyle {
    return TextStyle(
      color: AppColors.TEXT_COLOR,
      fontSize: 10.sp,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle get unselectedTabTextStyle {
    return TextStyle(
      color: AppColors.HINT_GREY_COLOR,
      fontSize: 10.sp,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle get taskListTitleTextStyle {
    return TextStyle(
      fontSize: 8.sp,
      color: AppColors.TASK_LIST_TITLE_COLOR,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle get taskListSheetTextStyle {
    return TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.DARK_BLACK_COLOR,
    );
  }
}
