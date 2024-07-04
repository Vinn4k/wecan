import '../../domain/entities/symptoms_response_entity.dart';

class SymptomsResponseModel extends SymptomsResponseEntity {
  SymptomsResponseModel({required super.id, required super.name});

  factory SymptomsResponseModel.fromJson(Map<String, dynamic> json) {
    return SymptomsResponseModel(
      id: int.parse(json['id']),
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
