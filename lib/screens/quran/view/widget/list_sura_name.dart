// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/screens/getstart/widget/buttom.dart';
import 'package:islami/screens/quran/view/widget/item_quran.dart';
import 'package:islami/services/api_services.dart';

class ListSuraName extends StatelessWidget {
  // Future _getSurahList() async {
  //   var data = await rootBundle.loadString('assets/data/list_surah.json');
  //   print(data);
  // }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiServices.getListSuraName(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.defulteColorLight,
            ),
          );
        } else if (snapshot.hasError) {
          Center(
            child: ButtonImageFb1(
                text: "Try again",
                onPressed: () {
                  ApiServices.getListSuraName();
                }),
          );
        }
        var quranList = snapshot.data;
        return ListView.builder(
          itemCount: surahList.length,
          itemBuilder: (context, index) {
            return ItemQuran(
              nameSurah: quranList![index].nama ?? '',
              nameSurahEn: quranList[index].namaLatin ?? '',
              numberOfAyat: quranList[index].jumlahAyat ?? 0,
              nomor: quranList[index].nomor ?? 0,
            );
          },
        );
      },
    );
  }
}
