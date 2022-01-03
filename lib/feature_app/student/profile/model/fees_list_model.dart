import 'dart:convert';

List<FeesModel> feesModelFromJson(String str) =>
    List<FeesModel>.from(json.decode(str).map((x) => FeesModel.fromJson(x)));

class FeesModel {
  FeesModel({
    this.id,
    this.classes,
    this.section,
    this.feeHead,
    this.feeTitle,
    this.status,
    this.paymentMethod,
    this.amount,
    this.student,
    this.dueDate,
    this.paymentNote,
    this.paymentDate,
  });

  int? id;
  String? classes;
  String? section;
  String? feeHead;
  String? feeTitle;
  String? status;
  String? paymentMethod;
  int? amount;
  String? student;
  String? dueDate;
  String? paymentNote;
  DateTime? paymentDate;

  factory FeesModel.fromJson(Map<String, dynamic> json) => FeesModel(
        id: json["id"] == null ? null : json["id"],
        classes: json["classes"] == null ? null : json["classes"],
        section: json["section"] == null ? null : json["section"],
        feeHead: json["fee_head"] == null ? null : json["fee_head"],
        feeTitle: json["fee_title"] == null ? null : json["fee_title"],
        status: json["status"] == null ? null : json["status"],
        paymentMethod:
            json["payment_method"] == null ? null : json["payment_method"],
        amount: json["amount"] == null ? null : json["amount"],
        student: json["student"] == null ? null : json["student"],
        dueDate: json["due_date"],
        paymentNote: json["payment_note"] == null ? null : json["payment_note"],
        paymentDate: json["payment_date"] == null
            ? null
            : DateTime.parse(json["payment_date"]),
      );
}
