import 'package:flutter/material.dart';
import 'package:job_search/view/widgets/auth/sign_up/last_name_textform.dart';
import 'package:nb_utils/nb_utils.dart';

import 'first_name_textform.dart';

class NameField extends StatelessWidget {
  const NameField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("First Name *", style: boldTextStyle()),
              8.height,
              FirstNameTextform(),
            ],
          ),
        ),
        20.width,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Last Name *", style: boldTextStyle()),
              8.height,
              LastNameTextform(),
            ],
          ),
        ),
      ],
    );
  }
}
