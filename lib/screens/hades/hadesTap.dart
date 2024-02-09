// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/theme/app_styles.dart';
import 'package:islami/screens/hades/display_content_hades.dart';
import 'package:islami/generated/l10n.dart';

class HadesTap extends StatefulWidget {
  @override
  State<HadesTap> createState() => _HadesTapState();
}

class _HadesTapState extends State<HadesTap> {
  List<HadesContent> printTitleAndContentHades = [];

  @override
  Widget build(BuildContext context) {
    if (printTitleAndContentHades.isEmpty) {
      readFileHades();
    }
    return Column(
      children: [
        Image.asset('assets/images/hadeth_logo.png'),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 35.h, vertical: 7.w),
          decoration: BoxDecoration(
            color: AppColors.defulteColorLight,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100.r),
                topRight: Radius.circular(100.r)),
          ),
          child: Text(
            S.of(context).Hadeth_name,
            style: AppStyles.textStyle25.copyWith(
                color: AppColors.blackColor, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        printTitleAndContentHades.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                  color: AppColors.defulteColorLight,
                ),
              )
            : Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(DisplayHades.routeName,
                          arguments: HadesContent(
                              title: printTitleAndContentHades[index].title,
                              body: printTitleAndContentHades[index].body));
                    },
                    child: Text(
                      printTitleAndContentHades[index].title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  separatorBuilder: (context, index) => Divider(
                    color: AppColors.defulteColorLight,
                    endIndent: MediaQuery.of(context).size.width * 0.06,
                    indent: MediaQuery.of(context).size.width * 0.06,
                  ),
                  itemCount: printTitleAndContentHades.length,
                ),
              ),
      ],
    );
  }

  void readFileHades() async {
    String contentHades =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> contentHadesList = contentHades.split('#\r\n');
    for (int i = 0; i < contentHadesList.length; i++) {
      List<String> splitListhades = contentHadesList[i].split('\n');
      String title = splitListhades[0];
      splitListhades.removeAt(0);
      var hadesContent = HadesContent(title: title, body: splitListhades);
      printTitleAndContentHades.add(hadesContent);
    }
    setState(() {});
  }
}

class HadesContent {
  String title;
  List<String> body;
  HadesContent({required this.title, required this.body});
}
