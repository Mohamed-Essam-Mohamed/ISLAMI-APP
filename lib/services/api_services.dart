// ignore_for_file: use_rethrow_when_possible, prefer_const_declarations

import "dart:convert";
import "package:dio/dio.dart";
import 'package:http/http.dart' as http;
import "package:islami/model/radio_model.dart";
import "package:islami/model/source_list_name_quran.dart";
import "package:islami/model/surah_detail.dart";

List<Surah> surahList = [];

// https://equran.id/api/surat
class ApiServices {
  static Future<List<Surah>> getListSuraName() async {
    final url = 'https://equran.id/api/surat';
    var respons = await http.get(Uri.parse(url));
    jsonDecode(respons.body).forEach((element) {
      surahList.add(Surah.fromJson(element));
    });

    return surahList;
  }

  static Future<SurahDetail> getSurahDetail(int numberSurah) async {
    //https://equran.id/api/surat/1
    Uri url = Uri.https('equran.id', '/api/surat/$numberSurah');
    var respons = await http.get(url);
    var json = jsonDecode(respons.body);
    var responsData = SurahDetail.fromJson(json);
    return responsData;
  }

  final Dio dio = Dio(BaseOptions(
    baseUrl: "https://mp3quran.net",
  ));

  Future<RadioModel> getRadios() async {
    var respons =
        await dio.get("/api/v3/radios", queryParameters: {'language': 'ar'});
    return RadioModel.fromJson(respons.data);
  }
}
