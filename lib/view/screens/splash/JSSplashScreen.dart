import 'package:flutter/material.dart';
import 'package:job_search/view/screens/auth/JSSignUpScreen.dart';
import 'package:job_search/view/widgets/splash/splash_body.dart';
import 'package:nb_utils/nb_utils.dart';

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
    await 3.seconds.delay;
    finish(context);
    JSSignUpScreen().launch(context, isNewTask: true);
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
