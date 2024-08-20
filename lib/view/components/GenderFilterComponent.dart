import 'package:flutter/material.dart';
import 'package:job_search/core/utils/JSColors.dart';
import 'package:job_search/provider/home_provider.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class GenderFilterComponent extends StatefulWidget {
  const GenderFilterComponent({Key? key}) : super(key: key);

  @override
  _JSRemoteFilterComponentState createState() =>
      _JSRemoteFilterComponentState();
}

class _JSRemoteFilterComponentState extends State<GenderFilterComponent> {
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
    return ListView.builder(
        itemCount:
            context.read<HomeProvider>().myConfigurations?.genders?.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: (_, i) {
          var gender = context.read<HomeProvider>();
          return Theme(
            data: Theme.of(context).copyWith(
              unselectedWidgetColor: Theme.of(context).iconTheme.color,
            ),
            child: RadioListTile(
              dense: true,
              contentPadding: EdgeInsets.only(left: 0, bottom: 0),
              activeColor: JPColors.js_primaryColor,
              value: gender.myConfigurations?.genders?[i],
              groupValue: gender.selectedGender,
              onChanged: (v) {
                if (v != null) {
                  setState(() {
                    gender.updateSelectedGender(v);
                  });
                }
              },
              title: Text(gender.myConfigurations?.genders?[i].name ?? '',
                  style: primaryTextStyle()),
            ),
          );
        });
  }
}
