import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quran_app/features/prophet_stories/data/prophet_model.dart';
import 'package:quran_app/features/prophet_stories/data/repo/get_prophet_repo.dart';

class GetProphetRpoImpl implements GetProphetRepo {
  @override
  Future<List<ProphetEntity>> getProphet() async {
    final prophet =
        await rootBundle.loadString('assets/json_data/prophet_stories.json');
    var prophetStories = json.decode(prophet) as List<dynamic>;
    var prophetStoriesList=prophetStories.map((e) => ProphetEntity.fromMap(e)).toList();
    return prophetStoriesList;
  }
}
