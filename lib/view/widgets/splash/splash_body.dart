import 'package:flutter/material.dart';
import 'package:job_search/core/utils/JSImage.dart';
import 'package:nb_utils/nb_utils.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width(),
      height: context.height(),
      // color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              JPImages.jpSplashGif,
              fit: BoxFit.fill,
              //color: appStore.isDarkModeOn ? white : JPColors.js_primaryColor,
            ),
          ),
          // Image.asset(JPImages.js_loader, height: 35.0, width: 35.0),
        ],
      ).center(),
    );
  }
}
