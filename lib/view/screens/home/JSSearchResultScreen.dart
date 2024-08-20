import 'package:flutter/material.dart';
import 'package:job_search/view/widgets/home/job_search/career_levels_filter.dart';
import 'package:job_search/view/widgets/home/job_search/country_filter.dart';
import 'package:job_search/view/widgets/home/job_search/functional_area.dart';
import 'package:job_search/view/widgets/home/job_search/industries_filter.dart';
import 'package:job_search/view/widgets/home/job_search/job_experiences_filter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:job_search/view/components/JSFilteredResultsComponent.dart';
import 'package:job_search/view/screens/home/JSFilteredScreen.dart';
import 'package:job_search/core/utils/JSWidget.dart';

class JSSearchResultScreen extends StatefulWidget {
  final String? jobTitle;
  final String? city;

  JSSearchResultScreen({this.jobTitle, this.city});

  @override
  _JSSearchResultScreenState createState() => _JSSearchResultScreenState();
}

class _JSSearchResultScreenState extends State<JSSearchResultScreen> {
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
          bottomSheet: false,
          backWidget: true,
          homeAction: true, callBack: () {
        setState(() {});
        scaffoldKey.currentState!.openDrawer();
      }),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.only(left: 16, right: 16, top: 8),
            decoration: boxDecorationWithRoundedCorners(
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                    spreadRadius: 3,
                    blurRadius: 0.5,
                    color: gray.withOpacity(0.2))
              ],
              backgroundColor: context.scaffoldBackgroundColor,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.search, size: 18),
                    16.width,
                    Text(widget.jobTitle.validate(), style: primaryTextStyle()),
                  ],
                ),
                //Divider(color: gray.withOpacity(0.5)),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Row(
                //       children: [
                //         Icon(Icons.location_on, size: 18),
                //         16.width,
                //         Text(widget.city.validate(), style: primaryTextStyle()),
                //       ],
                //     ),
                //     Row(
                //       children: [
                //         Icon(Icons.directions_car, size: 18),
                //         8.width,
                //         Text("25 mi", style: primaryTextStyle(size: 14)),
                //       ],
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                filteredWidget(widget: Icon(Icons.filter_list, size: 18))
                    .cornerRadiusWithClipRRect(8)
                    .onTap(() {
                  JSFilteredScreen().launch(context);
                }),
                8.width,
                CountryFilter(),
                8.width,
                FunctionalAreaFilter(),
                8.width,
                IndustriesFilter(),
                8.width,
                JobExperiencesFilter(),
                8.width,
                CareerLevelsFilter(),
              ],
            ),
          ),
          8.height,
          Text(
            "${widget.jobTitle.validate()} jobs",
            style: primaryTextStyle(),
            textAlign: TextAlign.start,
          ).paddingOnly(left: 16),
          4.height,
          Row(
            children: [
              Text("page 1 of 545 jobs", style: secondaryTextStyle()),
              4.width,
              Icon(Icons.help, color: gray.withOpacity(0.5), size: 18),
            ],
          ).paddingOnly(left: 16),
          16.height,
          JSFilteredResultsComponent(city: widget.city.validate()).expand(),
        ],
      ),
    );
  }
}
