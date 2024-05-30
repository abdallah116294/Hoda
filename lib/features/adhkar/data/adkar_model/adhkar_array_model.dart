
class AdhkarArrayEntity  {
  int? id;
  String? text;
  int? count;
  String? audio;
  String? filename;
  AdhkarArrayEntity({
    required this.id,
    required this.text,
    required this.count,
    required this.audio,
    required this.filename,
  });
  factory AdhkarArrayEntity.fromJson(Map<String, dynamic> json) {
    return AdhkarArrayEntity(
      id: json['id'],
      text: json['text'],
      count: json['count'],
      audio: json['audio'],
      filename: json['filename'],
    );
  }
}
