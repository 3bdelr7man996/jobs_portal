import 'package:flutter/material.dart';
import 'package:job_search/core/utils/JSColors.dart';
import 'package:job_search/core/utils/JSConstant.dart';
import 'package:mobx/mobx.dart';
import 'package:nb_utils/nb_utils.dart';

part 'AppStore.g.dart';

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {
  @observable
  bool isDarkModeOn = false;

  @observable
  bool isHover = false;

  @observable
  Color? scaffoldBackground;

  @observable
  Color? backgroundColor;

  @observable
  Color? backgroundSecondaryColor;

  @observable
  Color? textPrimaryColor;

  @observable
  Color? appColorPrimaryLightColor;

  @observable
  Color? textSecondaryColor;

  @observable
  Color? appBarColor;

  @observable
  Color? iconColor;

  @observable
  Color? iconSecondaryColor;

  @observable
  var selectedDrawerItem = -1;

  @action
  Future<void> toggleDarkMode({bool? value}) async {
    isDarkModeOn = value ?? !isDarkModeOn;

    if (isDarkModeOn) {
      scaffoldBackground = JPColors.appBackgroundColorDark;

      appBarColor = JPColors.appBackgroundColorDark;
      backgroundColor = Colors.white;
      backgroundSecondaryColor = Colors.white;
      appColorPrimaryLightColor = JPColors.cardBackgroundBlackDark;

      iconColor = JPColors.iconColorPrimary;
      iconSecondaryColor = JPColors.iconColorSecondary;

      textPrimaryColor = whiteColor;
      textSecondaryColor = Colors.white54;

      textPrimaryColorGlobal = whiteColor;
      textSecondaryColorGlobal = Colors.white54;
      shadowColorGlobal = JPColors.appShadowColorDark;
    } else {
      scaffoldBackground = whiteColor;

      appBarColor = Colors.white;
      backgroundColor = Colors.black;
      backgroundSecondaryColor = JPColors.appSecondaryBackgroundColor;
      appColorPrimaryLightColor = JPColors.appColorPrimaryLight;

      iconColor = JPColors.iconColorPrimaryDark;
      iconSecondaryColor = JPColors.iconColorSecondaryDark;

      textPrimaryColor = JPColors.appTextColorPrimary;
      textSecondaryColor = JPColors.appTextColorSecondary;

      textPrimaryColorGlobal = JPColors.appTextColorPrimary;
      textSecondaryColorGlobal = JPColors.appTextColorSecondary;
      shadowColorGlobal = JPColors.appShadowColor;
    }
    setStatusBarColor(scaffoldBackground!);

    setValue(isDarkModeOnPref, isDarkModeOn);
  }

  @action
  void toggleHover({bool value = false}) => isHover = value;

  @action
  void setDrawerItemIndex(int aIndex) {
    selectedDrawerItem = aIndex;
  }
}
