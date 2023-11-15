import 'dart:convert';

PatientModel patientModelFromJson(String str) => PatientModel.fromJson(json.decode(str));

String patientModelToJson(PatientModel data) => json.encode(data.toJson());

class PatientModel {
    List<Result>? result;
    String? message;
    int? totalCount;

    PatientModel({
         this.result,
         this.message,
         this.totalCount,
    });

    factory PatientModel.fromJson(Map<String, dynamic> json) => PatientModel(
        result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
        message: json["message"],
        totalCount: json["total_count"],
    );

    Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
        "message": message,
        "total_count": totalCount,
    };
}

class Result {
    String? id;
    String? registrationId;
    String? patientName;
    String? gender;
    String? age;
    String? address;
    String? mobileNo;
    String? profilePicture;
    DateTime? dateOfBirth;
    String? email;
    String? clinicId;
    String? userId;

    Result({
         this.id,
         this.registrationId,
         this.patientName,
         this.gender,
         this.age,
         this.address,
         this.mobileNo,
         this.profilePicture,
         this.dateOfBirth,
         this.email,
         this.clinicId,
         this.userId,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        registrationId: json["registration_id"],
        patientName: json["patient_name"],
        gender: json["gender"]!,
        age: json["age"],
        address: json["address"],
        mobileNo: json["mobile_no"],
        profilePicture: json["profile_picture"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        email: json["email"],
        clinicId: json["clinic_id"],
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "registration_id": registrationId,
        "patient_name": patientName,
        "gender": genderValues.reverse[gender],
        "age": age,
        "address": address,
        "mobile_no": mobileNo,
        "profile_picture": profilePicture,
        "date_of_birth": "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "email": email,
        "clinic_id": clinicId,
        "user_id": userId,
    };
}

enum Gender { EMPTY, F, M }

final genderValues = EnumValues({
    "": Gender.EMPTY,
    "F": Gender.F,
    "M": Gender.M
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}