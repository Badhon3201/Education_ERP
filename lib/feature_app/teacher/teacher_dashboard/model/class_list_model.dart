import 'dart:convert';

ClassListModel feesModelFromJson(String str) =>
    ClassListModel.fromJson(json.decode(str));

String feesModelToJson(ClassListModel data) => json.encode(data.toJson());

class ClassListModel {
  ClassListModel({
    this.classes,
  });

  Map<String, String>? classes;

  factory ClassListModel.fromJson(Map<String, dynamic> json) => ClassListModel(
        classes: json["classes"] == null
            ? null
            : Map.from(json["classes"])
                .map((k, v) => MapEntry<String, String>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "classes": classes == null
            ? null
            : Map.from(classes!).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
