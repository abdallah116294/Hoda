
class ProphetEntity  {
  int? id;
  String? prophet_name;
  String? brief;
  ProphetEntity({
    required this.id,
    required this.prophet_name,
    required this.brief,
  });

factory ProphetEntity.fromMap(Map<String, dynamic> map) {
  return ProphetEntity(
    id: map['id'],
    prophet_name: map['prophet_name'],
    brief: map['brief'],
  );
}
}
