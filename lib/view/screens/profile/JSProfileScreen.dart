import 'package:flutter/material.dart';
import 'package:job_search/provider/home_provider.dart';
import 'package:job_search/provider/profile_provider.dart';
import 'package:job_search/view/widgets/profile/about_me_tab.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:job_search/view/components/JSCvComponent.dart';
import 'package:job_search/view/components/JSDrawerScreen.dart';
import 'package:job_search/core/utils/JSColors.dart';
import 'package:job_search/core/utils/JSWidget.dart';
import 'package:job_search/main.dart';
import 'package:provider/provider.dart';

class JSProfileScreen extends StatefulWidget {
  const JSProfileScreen({super.key});

  @override
  _JSProfileScreenState createState() => _JSProfileScreenState();
}

class _JSProfileScreenState extends State<JSProfileScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  // List<JSPopularCompanyModel> skillList = getSkillList();

  TabController? controller;
  final formKey = GlobalKey<FormState>();
  late ProfileProvider profileProvider;
  late HomeProvider homeProvider;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    profileProvider = context.read<ProfileProvider>();
    homeProvider = context.read<HomeProvider>();
    await context.read<HomeProvider>().fetchAppConfigurations();
    if (context.mounted) {
      await context.read<ProfileProvider>().fetchProfile();
    } //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    profileProvider = context.read<ProfileProvider>();
    homeProvider = context.read<HomeProvider>();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: scaffoldKey,
        drawer: const JSDrawerScreen(),
        appBar: jsAppBar(context,
            backWidget: true,
            homeAction: true,
            message: false,
            notifications: false,
            bottomSheet: true, callBack: () {
          setState(() {});
          scaffoldKey.currentState!.openDrawer();
        }),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.height,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: boxDecorationWithRoundedCorners(
                    boxShape: BoxShape.circle,
                    border:
                        Border.all(color: JPColors.js_primaryColor, width: 4),
                    backgroundColor: context.scaffoldBackgroundColor,
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Text('SJ', style: boldTextStyle(size: 22)),
                ),
                16.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(profileProvider.joUser?.name ?? '',
                              style: boldTextStyle(size: 22)),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.edit,
                                color: JPColors.js_primaryColor))
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: context.iconColor),
                        8.width,
                        if (homeProvider.myConfigurations != null &&
                            profileProvider.joUser != null &&
                            homeProvider.myConfigurations?.countries != null &&
                            profileProvider.joUser?.countryId != null)
                          Text(
                              homeProvider.myConfigurations!.countries!
                                  .firstWhere((e) =>
                                      e.id == profileProvider.joUser!.countryId)
                                  .name!,
                              style: boldTextStyle()),
                      ],
                    ),
                  ],
                ).expand()
              ],
            ).paddingSymmetric(horizontal: 16, vertical: 16),
            TabBar(
              labelColor: appStore.isDarkModeOn ? white : black,
              unselectedLabelColor: gray,
              isScrollable: false,
              indicatorColor: JPColors.js_primaryColor,
              tabs: const [
                Tab(
                    child: Text("CV",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16))),
                Tab(
                    child: Text("About me",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16))),
              ],
              controller: controller,
            ),
            TabBarView(
              children: [
                const JSCvComponent(),
                AboutMeTab(
                  formKey: formKey,
                ),
              ],
            ).expand(),
          ],
        ),
      ),
    );
  }
}
