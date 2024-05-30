import 'package:quran_app/features/prophet_stories/data/prophet_model.dart';

abstract class GetProphetRepo{
  Future<List<ProphetEntity>>getProphet();
}