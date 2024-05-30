import 'package:quran_app/features/adhkar/data/adkar_model/adhkar_array_model.dart';

class AdhkarsEntity {
  int? id;
  String? category;
  String? audio;
  String? filename;
  List<AdhkarArrayEntity>? array;
  AdhkarsEntity({
    required this.id,
    required this.category,
    required this.audio,
    required this.filename,
    required this.array,
  });
  factory AdhkarsEntity.fromMap(Map<String, dynamic> map) {
    return AdhkarsEntity(
        id: map['id'],
        array: map['array']!=null?(map['array'] as List).map((e) => AdhkarArrayEntity.fromJson(e)).toList():null,
        audio: map['audio'],
        category: map['category'],
        filename: map['filename']);
  }
}
