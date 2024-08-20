import 'package:flutter/material.dart';
import 'package:job_search/core/utils/JSWidget.dart';
import 'package:job_search/main.dart';
import 'package:job_search/provider/sign_in_provider.dart';
import 'package:job_search/view/widgets/auth/sign_in/create_new_account_rich_text.dart';
import 'package:job_search/view/widgets/auth/sign_in/sigm_in_password.dart';
import 'package:job_search/view/widgets/auth/sign_in/sign_in_button.dart';
import 'package:job_search/view/widgets/auth/sign_in/sign_in_email.dart';
import 'package:job_search/view/widgets/auth/sign_up/sign_up_header.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class JOSignInScreen extends StatelessWidget {
  JOSignInScreen({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: jsAppBar(context, backWidget: false, homeAction: true),
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
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              ),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    16.height,
                    Text("Email address*", style: boldTextStyle()),
                    8.height,
                    SignInEmailTextform(),
                    16.height,
                    Text("Password *", style: boldTextStyle()),
                    8.height,
                    SignInPassword(),
                    100.height,
                  ],
                ),
              ),
            ),
            Consumer<SignInProvider>(builder: (context, provider, _) {
              return provider.signInLoad
                  ? Loader()
                  : SignInButton(
                      formKey: formKey,
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          await context.read<SignInProvider>().signIn(context);
                        }
                      },
                    );
            }),
            10.height,
            const CreateNewAccountRichText(),
          ],
        ),
      ),
    );
  }
}
