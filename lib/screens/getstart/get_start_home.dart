// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/theme/app_styles.dart';
import 'package:islami/screens/getstart/widget/buttom.dart';
import 'package:islami/screens/home_screen.dart';
import 'package:islami/generated/l10n.dart';

import 'package:islami/providers/provider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HomeGetstart extends StatefulWidget {
  static const String routeName = 'HomeGetstart';

  @override
  State<HomeGetstart> createState() => _HomeGetstartState();
}

class _HomeGetstartState extends State<HomeGetstart> {
  @override
  Widget build(BuildContext context) {
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
          body: Container(
            margin: EdgeInsets.all(13.h),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).Islami,
                  style: AppStyles.textStyle30,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Learn Qran and \nRecite once every day",
                  style:
                      AppStyles.textStyle20.copyWith(color: Colors.grey[700]),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 40.h,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      margin: EdgeInsets.all(18.h),
                      height: MediaQuery.of(context).size.height * 0.60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.r),
                      ),
                      child: Lottie.asset(
                        'animations/1.json',
                        reverse: true,
                        repeat: true,
                      ),
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width * 0.25,
                      top: MediaQuery.of(context).size.height * 0.55,
                      child: ButtonImageFb1(
                        text: "Get Started",
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              HomeScreen.routeName, (route) => false);
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
