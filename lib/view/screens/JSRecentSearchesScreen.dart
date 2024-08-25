import 'package:flutter/material.dart';
import 'package:job_search/provider/home_provider.dart';
import 'package:job_search/view/widgets/home/recent_search.dart/modal_job_details.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class JSRecentSearchesScreen extends StatefulWidget {
  const JSRecentSearchesScreen({Key? key}) : super(key: key);

  @override
  _JSRecentSearchesScreenState createState() => _JSRecentSearchesScreenState();
}

class _JSRecentSearchesScreenState extends State<JSRecentSearchesScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    await context.read<HomeProvider>().getLocalSearchJob();
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Recent searches", style: boldTextStyle(size: 18)),
                  // OutlinedButton(
                  //   onPressed: () {},
                  //   style: OutlinedButton.styleFrom(
                  //       side: BorderSide(
                  //           width: 1.0, color: JPColors.js_primaryColor)),
                  //   child: Text("Edit",
                  //       style: boldTextStyle(color: JPColors.js_primaryColor)),
                  // )
                ],
              ),
              8.height,
              RecentSearchesList(),
              24.height,
            ],
          ).paddingSymmetric(horizontal: 16),
          // Divider(),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Expanded(
          //       child: Text("ndz@privaterelay.applied.com",
          //           style: boldTextStyle()),
          //     ),
          //     Icon(Icons.arrow_forward_ios, size: 18),
          //   ],
          // ).paddingOnly(left: 16, right: 16, top: 16, bottom: 16),
          //JSSettingComponent(),
        ],
      ),
    );
  }
}

class RecentSearchesList extends StatelessWidget {
  const RecentSearchesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, _) {
      if (provider.localJobList.isEmpty) {
        return Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Text("No Results"),
          ),
        );
      } else {
        return SizedBox(
          height: context.height() * 0.6,
          child: ListView.builder(
              itemCount: provider.localJobList.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${provider.localJobList[index].title}",
                        style: boldTextStyle()),
                    GestureDetector(
                      onTap: () async {
                        await showModalJobDetils(
                          context,
                          job: provider.localJobList[index],
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${provider.localJobList[index].description}",
                              style: secondaryTextStyle()),
                          Icon(Icons.arrow_forward_ios, size: 18),
                        ],
                      ),
                    ),
                    Text(
                        "${provider.myConfigurations?.countries?.firstWhere((e) {
                          return e.id == provider.localJobList[index].countryId;
                        }).name}",
                        style: secondaryTextStyle()),
                  ],
                );
              }),
        );
      }
    });
  }
}
