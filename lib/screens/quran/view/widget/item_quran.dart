// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/theme/app_styles.dart';
import 'package:islami/screens/quran/view/widget/quran_tap_display_sura&audio.dart';
import 'package:islami/model/surah_name_model.dart';

class ItemQuran extends StatelessWidget {
  String nameSurah;
  String nameSurahEn;
  int numberOfAyat;
  int nomor;

  ItemQuran({
    required this.nameSurah,
    required this.nameSurahEn,
    required this.numberOfAyat,
    required this.nomor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      onTap: () {
        Navigator.of(context).pushNamed(
          DisplayQuran.routeName,
          arguments: SurahName(
            index: nomor,
            suraName: nameSurah,
            suraNameEn: nameSurahEn,
            ayat: numberOfAyat,
          ),
        );
      },
      child: Column(
        children: [
          Container(
            child: ListTile(
              subtitle: Text(
                "Ayat : $numberOfAyat",
                style: AppStyles.textStyle17,
              ),
              title: Text(
                nameSurah,
                style: AppStyles.textStyle25,
              ),
              trailing: Text(
                nameSurahEn,
                style: AppStyles.textStyle25,
              ),
            ),
          ),
          Divider(
            color: AppColors.defulteColorLight,
            endIndent: MediaQuery.of(context).size.width * 0.06,
            indent: MediaQuery.of(context).size.width * 0.06,
          )
        ],
      ),
    );
  }
}
