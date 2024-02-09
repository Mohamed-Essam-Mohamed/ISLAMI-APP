import 'package:flutter/material.dart';
import 'package:islami/screens/getstart/widget/buttom.dart';
import 'package:islami/model/surah_detail.dart';
import 'package:islami/services/api_services.dart';

class MySurahDetail extends StatelessWidget {
  int nomor;
  MySurahDetail({required this.nomor});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SurahDetail>(
      future: ApiServices.getSurahDetail(nomor),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        } else if (snapshot.hasError) {
          Center(
            child: ButtonImageFb1(
              text: "Try again",
              onPressed: () {
                ApiServices.getSurahDetail(nomor);
              },
            ),
          );
        }
        var surahDetailList = snapshot.data?.ayat;
        return ListView.builder(
            itemCount: surahDetailList?.length,
            itemBuilder: (context, index) {
              return Text(surahDetailList?[index].ar ?? 'no');
            });
      },
    );
  }
}
