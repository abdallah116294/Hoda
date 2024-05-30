import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:quran_app/features/Quran/data/models/quran_model.dart';
import 'package:quran_app/features/Quran/data/repo/get_quran_repo.dart';

class GetQuranRepoImpl implements GetQuranRepo {
  @override
  Future<QuranModel> getQuarn() async {
    final quranjson =
        await rootBundle.loadString('assets/json_data/quran.json');
    final qurandata = json.decode(quranjson);
    var quranModel = QuranModel.fromJson(qurandata);
    log(quranModel.toString());
    return quranModel;
  }
}
