import 'package:flutter/material.dart';
import 'package:job_search/main.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:job_search/view/components/JSDrawerScreen.dart';
import 'package:job_search/view/screens/JSMessagesScreen.dart';
import 'package:job_search/core/utils/JSColors.dart';
import 'package:job_search/core/utils/JSConstant.dart';
import 'package:job_search/core/utils/JSImage.dart';
import 'package:job_search/core/utils/JSWidget.dart';

class JSNotificationScreen extends StatefulWidget {
  const JSNotificationScreen({Key? key}) : super(key: key);

  @override
  _JSNotificationScreenState createState() => _JSNotificationScreenState();
}

class _JSNotificationScreenState extends State<JSNotificationScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: jsAppBar(context,
          notifications: false,
          message: false,
          bottomSheet: true,
          backWidget: true,
          homeAction: true, callBack: () {
        setState(() {});
        scaffoldKey.currentState!.openDrawer();
      }),
      drawer: JSDrawerScreen(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.height,
            Stack(
              children: [
                Container(
                  height: context.height(),
                  padding: EdgeInsets.only(top: 32),
                  width: context.width(),
                  color: appStore.isDarkModeOn
                      ? cardDarkColor
                      : JPColors.js_backGroundColor.withOpacity(0.5),
                  child: Text("Notifications", style: boldTextStyle(size: 28))
                      .paddingOnly(left: 16),
                ),
                Positioned(
                  top: 80,
                  child: Container(
                    color: appStore.isDarkModeOn ? scaffoldDarkColor : white,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    width: context.width(),
                    child: Column(
                      children: [
                        16.height,
                        commonCachedNetworkImage(JPImages.js_notification,
                                height: 100, fit: BoxFit.cover)
                            .center(),
                        8.height,
                        Text(
                          "Welcome to your notification box!",
                          style: boldTextStyle(size: 30),
                          textAlign: TextAlign.center,
                        ).paddingSymmetric(horizontal: 16),
                        16.height,
                        Text(
                          "Once you begin a job search. we'II notify you here about matching job, the application status, resume tips, and helpful interview advice.",
                          style: secondaryTextStyle(size: 16),
                          textAlign: TextAlign.center,
                        ).paddingSymmetric(horizontal: 16),
                        16.height,
                        TextButton(
                          onPressed: () {
                            JSMessagesScreen().launch(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Find Jobs",
                                  style: boldTextStyle(
                                      color: JPColors.js_primaryColor,
                                      size: 18)),
                              8.width,
                              Icon(Icons.arrow_forward,
                                  color: JPColors.js_primaryColor,
                                  size: iconSize),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
