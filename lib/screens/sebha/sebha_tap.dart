// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:islami/core/theme/MyTheme.dart';
import 'package:islami/screens/sebha/animatedRotation.dart';
import 'package:islami/generated/l10n.dart';
import 'package:islami/providers/provider.dart';
import 'package:provider/provider.dart';

class SephaTap extends StatefulWidget {
  @override
  State<SephaTap> createState() => _SephaTapState();
}

class _SephaTapState extends State<SephaTap> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ChangeLunguageApp>(context);
    return Center(
      child: Column(
        children: [
          AnimatedSebha(
              imageTop: provider.themeMode == ThemeMode.light
                  ? 'assets/images/head_sebha_logo.png'
                  : 'assets/images/head_sebha_dark.png',
              imageBottom: provider.themeMode == ThemeMode.light
                  ? 'assets/images/body_sebha_logo.png'
                  : 'assets/images/body_sebha_dark.png',
              onClick: () {
                setState(() {
                  if (counter >= 0 && counter < 99) {
                    counter++;
                  } else {
                    counter = 0;
                  }
                });
              }),
          SizedBox(
            height: 20,
          ),
          Text(
            S.of(context).NumberOfAltasbihat,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            height: 70,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).primaryColor,
            ),
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              child: Text(
                '$counter',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            height: 50,
            width: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: provider.themeMode == ThemeMode.light
                  ? Theme.of(context).primaryColor
                  : MyTheme.yellowColor,
            ),
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              child: Text(
                calculatNumberTaspeh(counter),
                key: ValueKey(calculatNumberTaspeh(counter)),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: MyTheme.WhiteColor,
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }

  String calculatNumberTaspeh(int counter) {
    String sophan = 'سبحان الله';
    String hamd = 'الحمد لله';
    String alah = 'الله وأكبر';
    if (counter >= 0 && counter <= 33) {
      return sophan;
    } else if (counter > 33 && counter <= 66) {
      return hamd;
    } else if (counter > 66 && counter <= 99) {
      return alah;
    } else if (counter > 99) {
      counter = 0;
    }
    return sophan;
  }
}
