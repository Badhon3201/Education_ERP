import 'dart:convert';

StudentProfileModel studentProfileModelFromJson(String str) =>
    StudentProfileModel.fromJson(json.decode(str));

String studentProfileModelToJson(StudentProfileModel data) =>
    json.encode(data.toJson());

class StudentProfileModel {
  StudentProfileModel({
    this.id,
    this.studentId,
    this.name,
    this.roll,
    this.phone,
    this.photo,
    this.bloodGroup,
    this.dateOfAdmission,
    this.dateOfBirth,
    this.gender,
    this.religion,
    this.email,
    this.presentAddress,
    this.permanentAddress,
    this.fatherName,
    this.fatherPhone,
    this.motherName,
    this.motherPhone,
    this.guardianName,
    this.guardianPhone,
    this.photoOfFather,
    this.photoOfMother,
    this.photoOfGuardian,
    this.createdAt,
    this.classes,
    this.section,
    this.group,
    this.category,
    this.fatherOccupation,
    this.motherOccupation,
    this.guardianOccupation,
  });

  int? id;
  String? studentId;
  String? name;
  int? roll;
  String? phone;
  dynamic photo;
  dynamic bloodGroup;
  dynamic dateOfAdmission;
  dynamic dateOfBirth;
  String? gender;
  String? religion;
  String? email;
  String? presentAddress;
  String? permanentAddress;
  String? fatherName;
  String? fatherPhone;
  String? motherName;
  String? motherPhone;
  String? guardianName;
  String? guardianPhone;
  dynamic photoOfFather;
  dynamic photoOfMother;
  dynamic photoOfGuardian;
  String? createdAt;
  int? classes;
  int? section;
  dynamic group;
  dynamic category;
  dynamic fatherOccupation;
  dynamic motherOccupation;
  dynamic guardianOccupation;

  factory StudentProfileModel.fromJson(Map<String, dynamic> json) =>
      StudentProfileModel(
        id: json["id"],
        studentId: json["student_id"],
        name: json["name"],
        roll: json["roll"],
        phone: json["phone"],
        photo: json["photo"],
        bloodGroup: json["blood_group"],
        dateOfAdmission: json["date_of_admission"],
        dateOfBirth: json["date_of_birth"],
        gender: json["gender"],
        religion: json["religion"],
        email: json["email"],
        presentAddress: json["present_address"],
        permanentAddress: json["permanent_address"],
        fatherName: json["father_name"],
        fatherPhone: json["father_phone"],
        motherName: json["mother_name"],
        motherPhone: json["mother_phone"],
        guardianName: json["guardian_name"],
        guardianPhone: json["guardian_phone"],
        photoOfFather: json["photo_of_father"],
        photoOfMother: json["photo_of_mother"],
        photoOfGuardian: json["photo_of_guardian"],
        createdAt: json["photo_of_guardian"],
        classes: json["classes"],
        section: json["section"],
        group: json["group"],
        category: json["category"],
        fatherOccupation: json["father_occupation"],
        motherOccupation: json["mother_occupation"],
        guardianOccupation: json["guardian_occupation"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "student_id": studentId,
        "name": name,
        "roll": roll,
        "phone": phone,
        "photo": photo,
        "blood_group": bloodGroup,
        "date_of_admission": dateOfAdmission,
        "date_of_birth": dateOfBirth,
        "gender": gender,
        "religion": religion,
        "email": email,
        "present_address": presentAddress,
        "permanent_address": permanentAddress,
        "father_name": fatherName,
        "father_phone": fatherPhone,
        "mother_name": motherName,
        "mother_phone": motherPhone,
        "guardian_name": guardianName,
        "guardian_phone": guardianPhone,
        "photo_of_father": photoOfFather,
        "photo_of_mother": photoOfMother,
        "photo_of_guardian": photoOfGuardian,
        "created_at": createdAt,
        "classes": classes,
        "section": section,
        "group": group,
        "category": category,
        "father_occupation": fatherOccupation,
        "mother_occupation": motherOccupation,
        "guardian_occupation": guardianOccupation,
      };
}
