import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:quran_app/features/adhkar/data/adkar_model/adhkar_model.dart';
import 'package:quran_app/features/adhkar/data/repo/get_adhkar_repo.dart';

class GetAdhkarRepoImpl implements GetAdhkarRepo {
  @override
  Future<List<AdhkarsEntity>> getAdhkar() async {
    //load data form local json
    final adhkarData =
        await rootBundle.loadString('assets/json_data/adhkar.json');
    final adhkarList = json.decode(adhkarData) as List;
    log(adhkarList.toString());
    final adhakr=adhkarList.map((e) => AdhkarsEntity.fromMap(e)).toList();
    return adhakr;
  }
}
