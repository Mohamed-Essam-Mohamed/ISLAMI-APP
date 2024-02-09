import 'package:flutter/material.dart';

import 'package:islami/core/theme/MyTheme.dart';
import 'package:islami/screens/settings/show_change_them.dart';
import 'package:islami/screens/settings/show_modal.dart';
import 'package:islami/generated/l10n.dart';

import 'package:islami/providers/provider.dart';
import 'package:provider/provider.dart';

class SettingTap extends StatefulWidget {
  @override
  State<SettingTap> createState() => _SettingTapState();
}

class _SettingTapState extends State<SettingTap> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ChangeLunguageApp>(context);
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          S.of(context).Language,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(
          height: 25,
        ),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).primaryColor,
          ),
          child: InkWell(
            onTap: () {
              showModalBottomLunguage();
            },
            child: Row(
              children: [
                Text(
                  provider.appLunguage == 'en'
                      ? S.of(context).English
                      : S.of(context).Arabic,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                      ),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_drop_down,
                  size: 40,
                  color: MyTheme.WhiteColor,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          S.of(context).Theme,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(
          height: 25,
        ),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).primaryColor,
          ),
          child: InkWell(
            onTap: () {
              showModalBottomTheme();
            },
            child: Row(
              children: [
                Text(
                  provider.themeMode == ThemeMode.light
                      ? S.of(context).Light
                      : S.of(context).Dark,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                      ),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_drop_down,
                  size: 40,
                  color: MyTheme.WhiteColor,
                )
              ],
            ),
          ),
        )
      ]),
    );
  }

  void showModalBottomLunguage() {
    showModalBottomSheet(
      context: context,
      builder: (context) => ShowModal(),
    );
  }

  void showModalBottomTheme() {
    showModalBottomSheet(
      context: context,
      builder: (context) => ShowModalTheme(),
    );
  }
}
