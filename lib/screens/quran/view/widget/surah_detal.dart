import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/theme/app_styles.dart';

class MySurahDetail extends StatefulWidget {
  int nomor;

  MySurahDetail({required this.nomor});

  @override
  State<MySurahDetail> createState() => _MySurahDetailState();
}

class _MySurahDetailState extends State<MySurahDetail> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    if (verses.isEmpty) {
      loadingtfile();
    }
    return Container(
      margin: EdgeInsets.all(15.h),
      padding: EdgeInsets.all(8.h),
      decoration: BoxDecoration(
          color: AppColors.defulteColorLight,
          borderRadius: BorderRadius.circular(20.r)),
      child: ListView.builder(
          itemCount: verses.length,
          itemBuilder: (context, index) {
            return Container(
                margin: EdgeInsets.all(8.h),
                child: index == 0
                    ? Text(
                        '${verses[index]}    \uFD3F${(index + (index == 0 ? 2 : 1))}\uFD3E', //
                        style: AppStyles.textStyle25.copyWith(
                          fontFamily: 'me_quran',
                        ),
                        textDirection: TextDirection.rtl,
                      )
                    : Text(
                        '${verses[index]}    \uFD3F${(index + 2)}\uFD3E', //
                        style: AppStyles.textStyle25.copyWith(
                          fontFamily: 'me_quran',
                        ),
                        textDirection: TextDirection.rtl,
                      ));
          }),
    );
  }

  void loadingtfile() async {
    String content =
        await rootBundle.loadString('assets/files/${widget.nomor}.txt');
    List<String> lines = content.split('\n');
    verses = lines;
    setState(() {});
  }
}
