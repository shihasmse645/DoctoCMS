


import 'dart:convert';

LoginModel LoginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String LoginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    LoginResult result;
    String message;

    LoginModel({
        required this.result,
        required this.message,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        result: LoginResult.fromJson(json["result"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "result": result.toJson(),
        "message": message,
    };
}

class LoginResult {
    String clinicId;
    String clinicName;
    String mobileNo;
    String userId;
    String doctorName;
    String email;
    String baseDomainUrl;
    String password;
    String isDoctowhatsapp;

    LoginResult({
        required this.clinicId,
        required this.clinicName,
        required this.mobileNo,
        required this.userId,
        required this.doctorName,
        required this.email,
        required this.baseDomainUrl,
        required this.password,
        required this.isDoctowhatsapp,
    });

    factory LoginResult.fromJson(Map<String, dynamic> json) => LoginResult(
        clinicId: json["clinic_id"],
        clinicName: json["clinic_name"],
        mobileNo: json["mobile_no"],
        userId: json["user_id"],
        doctorName: json["doctor_name"],
        email: json["email"],
        baseDomainUrl: json["base_domain_url"],
        password: json["password"],
        isDoctowhatsapp: json["is_doctowhatsapp"],
    );



    Map<String, dynamic> toJson() => {
        "clinic_id": clinicId,
        "clinic_name": clinicName,
        "mobile_no": mobileNo,
        "user_id": userId,
        "doctor_name": doctorName,
        "email": email,
        "base_domain_url": baseDomainUrl,
        "password": password,
        "is_doctowhatsapp": isDoctowhatsapp,
    };
}