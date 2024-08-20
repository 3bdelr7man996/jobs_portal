import 'package:flutter/material.dart';
import 'package:job_search/provider/home_provider.dart';
import 'package:job_search/view/widgets/home/job_search/salary_filter_text_form.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:job_search/view/components/GenderFilterComponent.dart';
import 'package:job_search/data/model/JSPopularCompanyModel.dart';
import 'package:job_search/core/utils/JSColors.dart';
import 'package:job_search/core/utils/JSDataGenerator.dart';
import 'package:job_search/core/utils/JSWidget.dart';
import 'package:provider/provider.dart';

class JSFilteredScreen extends StatefulWidget {
  const JSFilteredScreen({Key? key}) : super(key: key);

  @override
  _JSFilteredScreenState createState() => _JSFilteredScreenState();
}

class _JSFilteredScreenState extends State<JSFilteredScreen> {
  int? remoteValue = 0;

  List<JSPopularCompanyModel> remoteList = getRemoteList();

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
      appBar: jsAppBar(context,
          bottomSheet: false, backWidget: true, homeAction: true),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: boxDecorationWithRoundedCorners(
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 0.8,
                        blurRadius: 1,
                        color: gray.withOpacity(0.8)),
                  ],
                  borderRadius: BorderRadius.circular(0),
                  backgroundColor: context.scaffoldBackgroundColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: boxDecorationWithRoundedCorners(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                            color: JPColors.js_primaryColor, width: 2),
                        backgroundColor: context.scaffoldBackgroundColor,
                      ),
                      child: IconButton(
                          onPressed: () {
                            finish(context);
                          },
                          icon: Icon(Icons.close)),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text("Filters", style: boldTextStyle())),
                    TextButton(
                        onPressed: () {
                          context.read<HomeProvider>().resetFilter();
                          finish(context);
                        },
                        child: Text("Reset",
                            style: boldTextStyle(
                                color: JPColors.js_primaryColor))),
                  ],
                ).paddingOnly(left: 8, right: 8, bottom: 16),
              ),
              24.height,
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Gender", style: boldTextStyle(size: 18))
                        .paddingOnly(left: 16),
                    16.height,
                    GenderFilterComponent(),
                    Divider(color: gray.withOpacity(0.4)),
                    24.height,
                    Text("Salary", style: boldTextStyle(size: 18))
                        .paddingOnly(left: 16),
                    16.height,

                    Row(
                      children: [
                        SalaryFromTextForm(),
                        //20.width,
                        SalaryToTextForm(),
                      ],
                    ),
                    // JSSortByComponent(),
                    // Divider(color: gray.withOpacity(0.4)),
                    // 24.height,
                    // Text("Date Posted", style: boldTextStyle(size: 18))
                    //     .paddingOnly(left: 16),
                    // 16.height,
                    //JSDatePostedComponent(),
                  ],
                ),
              ).expand(),
            ],
          ).paddingOnly(bottom: 80),
          Positioned(
            left: 0,
            right: 0,
            bottom: 8,
            child: AppButton(
              onTap: () {
                context.read<HomeProvider>().searchJob();
                finish(context);
              },
              width: context.width(),
              margin: EdgeInsets.all(16),
              color: JPColors.js_primaryColor,
              child: Text("Update", style: boldTextStyle(color: white)),
            ),
          )
        ],
      ),
    );
  }
}
