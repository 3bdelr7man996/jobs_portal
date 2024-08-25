import 'package:flutter/material.dart';
import 'package:job_search/data/model/search_job_model.dart';
import 'package:job_search/provider/home_provider.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:job_search/core/utils/JSWidget.dart';
import 'package:job_search/main.dart';
import 'package:provider/provider.dart';

class JSJobDetailComponent extends StatefulWidget {
  final SearchData? filteredResultsList;

  JSJobDetailComponent({this.filteredResultsList});

  @override
  _JSJobDetailComponentState createState() => _JSJobDetailComponentState();
}

class _JSJobDetailComponentState extends State<JSJobDetailComponent> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    await context
        .read<HomeProvider>()
        .fetchJobDetails(widget.filteredResultsList?.slug ?? '');
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, _) {
      if (provider.detailsLoad) {
        return Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Loader(),
          ),
        );
      } else if (provider.detailsLoad == false && provider.jobDetails == null) {
        return Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Text("No Details Found"),
          ),
        );
      } else {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 30,
                      height: 5,
                      decoration: boxDecorationWithRoundedCorners(
                        borderRadius: BorderRadius.circular(4),
                        backgroundColor: appStore.isDarkModeOn ? white : black,
                      ),
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 16, left: 24),
                    ),
                  ).expand(),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        finish(context);
                      },
                      padding: EdgeInsets.all(16),
                      icon: Icon(Icons.file_upload_outlined, size: 26),
                      alignment: Alignment.topRight,
                    ),
                  ),
                ],
              ),
              32.height,
              //company name
              Text("${provider.jobDetails?.title ?? ''}",
                  style: boldTextStyle(size: 22)),
              // 8.height,
              // Text("review 44", style: primaryTextStyle()),
              8.height,
              Text(
                  '${context.read<HomeProvider>().myConfigurations?.countries?.firstWhere((country) {
                    return country.id == (provider.jobDetails?.countryId ?? -1);
                  }).name}',
                  style: primaryTextStyle()),
              8.height,
              // Container(
              //     padding: EdgeInsets.all(8),
              //     decoration: boxDecorationWithRoundedCorners(
              //       backgroundColor: appStore.isDarkModeOn
              //           ? scaffoldDarkColor
              //           : JPColors.js_backGroundColor,
              //     ),
              //     child: Text('Urgently needed', style: primaryTextStyle())),
              24.height,
              Text("Job details", style: boldTextStyle(size: 20)),
              16.height,
              if (provider.jobDetails?.salaryFrom != 0) ...[
                Text("Salary", style: boldTextStyle()),
                4.height,
                Text(
                    "${provider.jobDetails?.salaryFrom} - ${provider.jobDetails?.salaryTo} ${provider.jobDetails?.salaryCurrency ?? '\$'}",
                    style: primaryTextStyle()),
                16.height,
              ],
              Text("Job type", style: boldTextStyle()),
              4.height,
              jsGetPrimaryTitle("Full-time"),
              if (provider.jobDetails?.numOfPositions != null) ...[
                16.height,
                Text("Number of position for this role",
                    style: boldTextStyle()),
                8.height,
                Text("${provider.jobDetails?.numOfPositions}",
                    style: secondaryTextStyle()),
              ],
              Divider(),
              16.height,
              Text("Full Job Description", style: boldTextStyle(size: 20)),
              8.height,
              Text("${provider.jobDetails?.description ?? ''}",
                  style: primaryTextStyle()),

              16.height,
              Text("Career level", style: boldTextStyle()),
              8.height,
              Text(
                  '${context.read<HomeProvider>().myConfigurations?.careerLevels?.firstWhere((carrer) {
                    return carrer.id ==
                        (provider.jobDetails?.careerLevelId ?? -1);
                  }).name}',
                  style: secondaryTextStyle()),

              16.height,
              Text("Job Experiences", style: boldTextStyle()),
              8.height,
              Text(
                  '${context.read<HomeProvider>().myConfigurations?.jobExperiences?.firstWhere((exp) {
                    return exp.id ==
                        (provider.jobDetails?.jobExperienceId ?? -1);
                  }).name}',
                  style: secondaryTextStyle()),

              if (provider.jobDetails?.benefits != null) ...[
                16.height,
                Text("Benefits", style: boldTextStyle()),
                8.height,
                Text('${provider.jobDetails?.benefits}',
                    style: secondaryTextStyle()),
              ],

              16.height,
              Text("Expiry date", style: boldTextStyle()),
              8.height,
              Text('${provider.jobDetails?.expiryDate?.split(" ").first ?? ''}',
                  style: secondaryTextStyle()),

              24.height,
              // UL(
              //   children: [
              //     Text(
              //         "Experience of working on a UX Designer, UI Designer or other relevant position.",
              //         style: primaryTextStyle()),
              //     //16.height,
              //     Text("Experience in working with sketch and find job.",
              //         style: primaryTextStyle())
              //   ],
              // ),
            ],
          ).paddingOnly(left: 16, right: 16, bottom: 80),
        );
      }
    });
  }
}
