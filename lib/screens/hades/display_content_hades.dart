// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:islami/core/theme/MyTheme.dart';
import 'package:islami/screens/hades/hadesTap.dart';
import 'package:islami/generated/l10n.dart';

import 'package:islami/providers/provider.dart';
import 'package:provider/provider.dart';

class DisplayHades extends StatefulWidget {
  static const routeName = "DisplayHades";

  @override
  State<DisplayHades> createState() => _DisplayHadesState();
}

class _DisplayHadesState extends State<DisplayHades> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadesContent;
    var provider = Provider.of<ChangeLunguageApp>(context);
    return Stack(
      children: [
        Image.asset(
          provider.themeMode == ThemeMode.light
              ? 'assets/images/default_bg.png'
              : 'assets/images/dark_bg.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              S.of(context).Islami,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: Container(
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.01,
              vertical: MediaQuery.of(context).size.width * 0.07,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.r)),
              color: provider.themeMode == ThemeMode.light
                  ? MyTheme.WhiteColor
                  : MyTheme.defulteColorDark,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      args.title,
                      style: provider.themeMode == ThemeMode.light
                          ? Theme.of(context).textTheme.titleMedium
                          : Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: MyTheme.yellowColor),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.play_circle_filled,
                      size: 33,
                      color: provider.themeMode == ThemeMode.dark
                          ? MyTheme.yellowColor
                          : MyTheme.blackColor,
                    ),
                  ],
                ),
                Divider(
                  color: provider.themeMode == ThemeMode.light
                      ? Theme.of(context).primaryColor
                      : MyTheme.yellowColor,
                  thickness: 2,
                  endIndent: MediaQuery.of(context).size.width * 0.2,
                  indent: MediaQuery.of(context).size.width * 0.2,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) => Text(
                      args.body[index],
                      textAlign: TextAlign.center,
                      style: provider.themeMode == ThemeMode.light
                          ? Theme.of(context).textTheme.titleSmall
                          : Theme.of(context).textTheme.titleSmall?.copyWith(
                                color: MyTheme.yellowColor,
                              ),
                    ),
                    itemCount: args.body.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
