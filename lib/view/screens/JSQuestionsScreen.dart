import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:job_search/view/components/JSReviewComponent.dart';
import 'package:job_search/data/model/JSPopularCompanyModel.dart';
import 'package:job_search/core/utils/JSConstant.dart';
import 'package:job_search/core/utils/JSWidget.dart';
import 'package:job_search/main.dart';

class JSQuestionsScreen extends StatefulWidget {
  final JSPopularCompanyModel? popularCompanyList;

  JSQuestionsScreen({this.popularCompanyList});

  @override
  _JSQuestionsScreenState createState() => _JSQuestionsScreenState();
}

class _JSQuestionsScreenState extends State<JSQuestionsScreen> {
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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.height,
          Text(
            "321 questions about working ${widget.popularCompanyList!.companyName}",
            style: boldTextStyle(),
          ).paddingSymmetric(horizontal: 16),
          8.height,
          Container(
            height: textFieldHeight,
            decoration: boxDecoration(
                radius: 8,
                color: appStore.isDarkModeOn ? scaffoldDarkColor : white),
            child: AppTextField(
              textFieldType: TextFieldType.NAME,
              keyboardType: TextInputType.text,
              decoration: jsInputDecoration(
                  hintText: "Search keyword",
                  icon: Icon(Icons.search, color: context.iconColor)),
            ),
          ).paddingSymmetric(horizontal: 16),
          8.height,
          JSReviewComponent(),
        ],
      ),
    );
  }
}
