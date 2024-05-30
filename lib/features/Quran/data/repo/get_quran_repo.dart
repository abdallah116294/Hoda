import 'package:quran_app/features/Quran/data/models/quran_model.dart';

abstract class GetQuranRepo{
  Future<QuranModel>getQuarn();
}