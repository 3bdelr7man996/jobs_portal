import 'package:flutter/material.dart';
import 'package:job_search/core/utils/JSAppString.dart';
import 'package:job_search/provider/home_provider.dart';
import 'package:job_search/view/screens/home/JSJobSearchScreen.dart';
import 'package:job_search/view/screens/auth/JOSignInScreen.dart';
import 'package:job_search/view/widgets/splash/splash_body.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class JSSplashScreen extends StatefulWidget {
  const JSSplashScreen({Key? key}) : super(key: key);

  @override
  _JSSplashScreenState createState() => _JSSplashScreenState();
}

class _JSSplashScreenState extends State<JSSplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    setStatusBarColor(Colors.transparent);
    await context.read<HomeProvider>().fetchAppConfigurations();
    await initialize();
    await 2.seconds.delay;
    finish(context);
    if (getStringAsync(AppStrings.userToken).isEmpty) {
      JOSignInScreen().launch(context, isNewTask: true);
    } else {
      JSJobSearchScreen().launch(context, isNewTask: true);
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SplashBody());
  }
}
