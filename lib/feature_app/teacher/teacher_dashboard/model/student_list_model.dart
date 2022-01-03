// To parse this JSON data, do
//
//     final studentListModel = studentListModelFromJson(jsonString);

import 'dart:convert';

List<StudentListModel> studentListModelFromJson(String str) =>
    List<StudentListModel>.from(
        json.decode(str).map((x) => StudentListModel.fromJson(x)));

String studentListModelToJson(List<StudentListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StudentListModel {
  StudentListModel({
    this.id,
    this.name,
    this.studentListModelClass,
    this.section,
    this.roll,
  });

  int? id;
  String? name;
  Class? studentListModelClass;
  Section? section;
  int? roll;

  factory StudentListModel.fromJson(Map<String, dynamic> json) =>
      StudentListModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        studentListModelClass:
            json["class"] == null ? null : classValues.map[json["class"]],
        section:
            json["section"] == null ? null : sectionValues.map[json["section"]],
        roll: json["roll"] == null ? null : json["roll"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "class": studentListModelClass == null
            ? null
            : classValues.reverse![studentListModelClass],
        "section": section == null ? null : sectionValues.reverse![section],
        "roll": roll == null ? null : roll,
      };
}

enum Section { A }

final sectionValues = EnumValues({"A": Section.A});

enum Class { SEVEN }

final classValues = EnumValues({"Seven": Class.SEVEN});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
