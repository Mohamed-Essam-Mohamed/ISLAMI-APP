// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:islami/screens/hades/hadesTap.dart';

import 'package:islami/screens/quran/view/quran_tap.dart';
import 'package:islami/screens/radio/radio_tap.dart';
import 'package:islami/screens/sebha/sebha_tap.dart';
import 'package:islami/screens/settings/settings_tap.dart';

import 'package:islami/generated/l10n.dart';

import 'package:islami/providers/provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
  static const String routeName = "HomeScreen";
}

class _HomeScreenState extends State<HomeScreen> {
  int selectBouttomNavigationBar = 0;

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
          appBar: AppBar(
            title: Text(
              S.of(context).Islami,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Theme.of(context).primaryColor,
            ),
            child: BottomNavigationBar(
              currentIndex: selectBouttomNavigationBar,
              onTap: (index) {
                selectBouttomNavigationBar = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage(
                        'assets/images/icon_quran.png',
                      ),
                    ),
                    label: S.of(context).Quran),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/icon_radio.png'),
                    ),
                    label: S.of(context).Radio),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/icon_sebha.png'),
                    ),
                    label: S.of(context).Sebha),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/icon_hadeth.png'),
                    ),
                    label: S.of(context).Hadeth),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: S.of(context).Setting),
              ],
            ),
          ),
          body: bottomNavigationBar[selectBouttomNavigationBar],
        )
      ],
    );
  }

  List<Widget> bottomNavigationBar = [
    QuranTap(),
    RadioTap(),
    SephaTap(),
    HadesTap(),
    SettingTap()
  ];
}
