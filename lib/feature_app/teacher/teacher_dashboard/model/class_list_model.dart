// To parse this JSON data, do
//
//     final classListModel = classListModelFromJson(jsonString);

import 'dart:convert';

List<ClassListModel> classListModelFromJson(String str) =>
    List<ClassListModel>.from(
        json.decode(str).map((x) => ClassListModel.fromJson(x)));

String classListModelToJson(List<ClassListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClassListModel {
  ClassListModel({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory ClassListModel.fromJson(Map<String, dynamic> json) => ClassListModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
      };
}
