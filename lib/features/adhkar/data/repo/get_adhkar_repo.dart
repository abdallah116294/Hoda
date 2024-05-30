import 'package:quran_app/features/adhkar/data/adkar_model/adhkar_model.dart';

abstract class GetAdhkarRepo{
  Future<List<AdhkarsEntity>> getAdhkar();
}