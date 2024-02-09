// ignore_for_file: prefer_const_constructors, sort_child_properties_last
// no finsh it you need API

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/theme/MyTheme.dart';
import 'package:islami/core/theme/app_styles.dart';
import 'package:islami/model/radio_model.dart';
import 'package:islami/providers/provider.dart';
import 'package:islami/services/api_services.dart';
import 'package:provider/provider.dart';
import 'package:audioplayers/audioplayers.dart';

int counter = 0;
final player = AudioPlayer();
bool playOrStop = true;
bool check = true;

class RadioTap extends StatefulWidget {
  @override
  State<RadioTap> createState() => _RadioTapState();
}

class _RadioTapState extends State<RadioTap> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ChangeLunguageApp>(context);
    ApiServices apiServices = ApiServices();
    return FutureBuilder<RadioModel>(
        future: apiServices.getRadios(),
        builder: (context, snapshot) {
          var radioList = snapshot.data?.radios;
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 100.h),
                child: Image(
                  image: const AssetImage('assets/images/radio_image.png'),
                  width: 412.w,
                  height: 222.h,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.h),
                child: Text(
                  // S.of(context).BroadcastAlquranAlkarim,
                  radioList?[counter].name ?? 'loding...',
                  style: AppStyles.textStyle25,
                ),
              ),
              Container(
                padding: EdgeInsets.all(50.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        packRadio();
                      },
                      child: Image.asset(
                        'assets/images/Icon metro-next-1.png',
                        fit: BoxFit.fill,
                        width: 20.w,
                        height: 30.h,
                        color: provider.themeMode == ThemeMode.light
                            ? Theme.of(context).primaryColor
                            : MyTheme.yellowColor,
                      ),
                    ),
                    InkWell(
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Icon(
                        check ? Icons.play_arrow : Icons.pause,
                        size: 70.sp,
                        color: provider.themeMode == ThemeMode.light
                            ? Theme.of(context).primaryColor
                            : MyTheme.yellowColor,
                      ),
                      onTap: () async {
                        if (check) {
                          await player
                              .play(UrlSource(radioList?[counter].url ?? ''));
                          check = false;
                          setState(() {});
                        } else {
                          player.stop();
                          check = true;
                          setState(() {});
                        }
                      },
                    ),
                    InkWell(
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        nextRadio();
                      },
                      child: Image.asset(
                        'assets/images/Icon metro-next.png',
                        fit: BoxFit.fill,
                        width: 20.w,
                        height: 30.h,
                        color: provider.themeMode == ThemeMode.light
                            ? Theme.of(context).primaryColor
                            : MyTheme.yellowColor,
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }

  void nextRadio() {
    counter++;
    player.stop();
    check = true;

    setState(() {});
  }

  void packRadio() {
    if (counter > 0) {
      counter--;
      player.stop();
      check = true;

      setState(() {});
    }
  }
}
