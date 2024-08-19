import 'package:flutter/material.dart';
import 'package:job_search/core/utils/JSColors.dart';
import 'package:job_search/core/utils/JSImage.dart';
import 'package:job_search/main.dart';
import 'package:nb_utils/nb_utils.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.topCenter,
      color: appStore.isDarkModeOn
          ? scaffoldDarkColor
          : JPColors.js_backGroundColor,
      child: Image.asset(
        JPImages.jpLogo,
        height: 100,
      ),
    );
  }
}
