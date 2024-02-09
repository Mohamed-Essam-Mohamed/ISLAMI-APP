// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/theme/app_styles.dart';
import 'package:islami/screens/quran/view/widget/list_sura_name.dart';
import 'package:islami/generated/l10n.dart';

class QuranTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Image.asset(
            'assets/images/qur2an_screen_logo.png',
            height: MediaQuery.of(context).size.height * 0.25,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 35.h, vertical: 7.w),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100.r),
                topRight: Radius.circular(100.r)),
          ),
          child: Text(
            S.of(context).Sura_name,
            style: AppStyles.textStyle25
                .copyWith(color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(child: ListSuraName())
      ],
    );
  }
}
