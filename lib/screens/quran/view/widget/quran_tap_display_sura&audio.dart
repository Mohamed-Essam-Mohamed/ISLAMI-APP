// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:islami/core/theme/MyTheme.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/theme/app_styles.dart';
import 'package:islami/screens/quran/view/widget/surah_detal.dart';
import 'package:islami/generated/l10n.dart';

import 'package:islami/model/surah_name_model.dart';
import 'package:islami/providers/provider.dart';
import 'package:provider/provider.dart';

class DisplayQuran extends StatefulWidget {
  static const routeName = "DisplayQuran";

  @override
  State<DisplayQuran> createState() => _DisplayQuranState();
}

class _DisplayQuranState extends State<DisplayQuran> {
  List<String> verss = [];
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SurahName;
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
              provider.appLunguage == 'ar' ? args.suraName : args.suraNameEn,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.03,
                ),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  color: MyTheme.defulteColorLight,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      args.suraNameEn,
                      style: AppStyles.textStyle30,
                    ),
                    Text('The Opening', style: AppStyles.textStyle17),
                    Divider(
                      color: AppColors.blackColor,
                      endIndent: MediaQuery.of(context).size.width * 0.22,
                      indent: MediaQuery.of(context).size.width * 0.22,
                    ),
                    Text(
                      "Ayat ${args.ayat}",
                      style: AppStyles.textStyle17,
                    ),
                    Image.asset(
                      'assets/images/Vector.png',
                      color: AppColors.blackColor,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
              Expanded(child: MySurahDetail(nomor: args.index)),
            ],
          ),
        ),
      ],
    );
  }
}
