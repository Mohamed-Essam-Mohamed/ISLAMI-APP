import 'package:flutter/material.dart';
import 'package:islami/core/theme/MyTheme.dart';
import 'package:islami/generated/l10n.dart';
import 'package:islami/providers/provider.dart';
import 'package:provider/provider.dart';

class ShowModalTheme extends StatefulWidget {
  @override
  State<ShowModalTheme> createState() => _ShowModalThemeState();
}

class _ShowModalThemeState extends State<ShowModalTheme> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ChangeLunguageApp>(context);
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.30,
      child: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey,
              ),
              height: 10,
              width: 180,
            ),
          ),
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.light);
            },
            child: provider.themeMode == ThemeMode.light
                ? getSelectedItemWidget(S.of(context).Light)
                : getUnSelectedItemWidget(S.of(context).Light),
          ),
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
            },
            child: provider.themeMode == ThemeMode.dark
                ? getSelectedItemWidget(S.of(context).Dark)
                : getUnSelectedItemWidget(S.of(context).Dark),
          )
        ],
      ),
    );
  }

  Widget getSelectedItemWidget(String text) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Row(
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
          ),
          Spacer(),
          Icon(
            Icons.done,
            size: 30,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }

  Widget getUnSelectedItemWidget(String text) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Row(
        children: [
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: MyTheme.yellowColor),
          ),
        ],
      ),
    );
  }
}
