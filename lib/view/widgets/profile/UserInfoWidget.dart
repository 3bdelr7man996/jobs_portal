import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class UserInfoWidget extends StatelessWidget {
  final String label;
  final String value;

  const UserInfoWidget({Key? key, required this.label, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: boldTextStyle(size: 18)),
          4.height,
          Text(value, style: primaryTextStyle(size: 16)),
        ],
      ),
    );
  }
}
