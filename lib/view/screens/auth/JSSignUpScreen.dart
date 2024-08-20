import 'package:flutter/material.dart';
import 'package:job_search/provider/sign_up_provider.dart';
import 'package:job_search/view/widgets/auth/sign_up/back_to_login_rich_text.dart';
import 'package:job_search/view/widgets/auth/sign_up/sign_up_button.dart';
import 'package:job_search/view/widgets/auth/sign_up/sign_up_form.dart';
import 'package:job_search/view/widgets/auth/sign_up/sign_up_header.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:job_search/core/utils/JSWidget.dart';
import 'package:job_search/main.dart';
import 'package:provider/provider.dart';

class JSSignUpScreen extends StatefulWidget {
  const JSSignUpScreen({Key? key}) : super(key: key);

  @override
  _JSSignUpScreenState createState() => _JSSignUpScreenState();
}

class _JSSignUpScreenState extends State<JSSignUpScreen> {
  var formKey = GlobalKey<FormState>();
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
      appBar: jsAppBar(context, backWidget: true, homeAction: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SignUpHeader(),
            Container(
                // height: context.height() * 0.5,
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.only(bottom: 16),
                decoration: boxDecorationWithRoundedCorners(
                  backgroundColor:
                      appStore.isDarkModeOn ? scaffoldDarkColor : white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8)),
                ),
                child: SignUpForm(
                  formKey: formKey,
                )),
            //20.height,
            Consumer<SignUpProvider>(builder: (context, provider, _) {
              return provider.signUpLoad
                  ? Loader(accentColor: Colors.red)
                  : SignUpButton(
                      formKey: formKey,
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          await context.read<SignUpProvider>().signUp(context);
                        }
                      },
                    );
            }),
            10.height,
            BackToLoginRichText(),
            10.height,
          ],
        ),
      ),
    );
  }
}
