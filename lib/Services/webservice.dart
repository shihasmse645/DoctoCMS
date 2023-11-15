import 'dart:convert';

import 'package:doctocms/AppModels/loginModel.dart';
import 'package:doctocms/AppModels/patientsModel.dart';
import 'package:http/http.dart' as http;

class Webservice {
  //Login
  Future<Map<String, dynamic>> login(
      String username, String password, String clinicId) async {
    var result;

    final Map<String, dynamic> logindata = {
      "username": username,
      "password": password,
      "clinicId": clinicId,
    };

    // String raw=jsonEncode(logindata);
    // print(raw);
    // print(jsonDecode(raw));

    //print(logindata.toString());

    var token =
        "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
    String basicAuth = 'Basic ' + token;
    print(basicAuth);
    final url =
        "https://app.doctosmart.com/api/authentication/login?username=$username&password=$password&clinic_id=$clinicId";

    final response = await http.post(Uri.parse(url),
        body: logindata.toString(),

        // headers: {'Content-Type': 'application/json'}
        headers: {'Authorization': 'Basic $token'});

    //print(response.statusCode);
    if (response.statusCode == 200) {
      print("inside 200");
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      // print(
      // "status code ____" + response.statusCode.toString());
      //print("response ______" + response.body.toString());
      var userData = responseData;

      //print("userData :" + userData.toString());

      LoginModel user = LoginModel.fromJson(userData);

      //var userData = log.fromJson(jsonDecode(response.body));
      result = {'status': true, 'message': 'Successful', 'user': user};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  //Fetch Patient List
  Future<Map<String, dynamic>> patient(String userId, String clinicId) async {
    var result;
    var token =
        "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
    String basicAuth = 'Basic ' + token;
    // ignore: avoid_print
    print(basicAuth);
    final url =
        "https://app.doctosmart.com/api/patients?user_id=$userId&clinic_id=$clinicId&page_no=0";
    final response = await http.get(Uri.parse(url),
        headers: {'Authorization': 'Basic $token'});
    print(response.statusCode);
    if (response.statusCode == 200) {
      print("inside 200");
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      var userData = responseData;
      PatientModel user = PatientModel.fromJson(userData);
      result = {'status': true, 'message': 'Successful', 'user': user};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  //Add Patients
  var image;
  Future<Map<String, dynamic>> addPatient(
      profilePicture,
      String patientName,
      String mobileNo,
      String age,
      String email,
      String address,
      String dateOfBirth,
      String gender,
      String userId,
      String clinicId) async {
    var token =
        "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";

    var requset = http.MultipartRequest(
        "POST", Uri.parse("https://app.doctosmart.com/api/patients?"));

    requset.headers['Authorization'] = 'Basic $token';

    image = await http.MultipartFile.fromPath(
        "profile_picture", profilePicture.path.toString());
    requset.files.add(image);
    requset.fields['patient_name'] = patientName;
    requset.fields['mobile_no'] = mobileNo;
    requset.fields['age'] = age;
    requset.fields['email'] = email;
    requset.fields['address'] = address;
    requset.fields['date_of_birth'] = dateOfBirth;
    requset.fields['gender'] = gender;
    requset.fields['user_id'] = userId;
    requset.fields['clinic_id'] = clinicId;

    var response = await requset.send();
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);

    Map<String, dynamic> result;

    if (response.statusCode == 200) {
      result = {
        'status': true,
        'message': 'Successful',
        'user': responseString
      };
    } else {
      result = {'status': false, 'message': "error"};
    }
    return result;
  }
  //Patient details
  Future<Map<String, dynamic>> PatientDatail(
    String id,
    String userId,
    String clinicId
  ) async{
    var result;
    var token =
        "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
    String basicAuth = 'Basic ' + token;
    // ignore: avoid_print
    print(basicAuth);
    final url =
        "https://app.doctosmart.com/api/patients?patient_id=$id&user_id=$userId&clinic_id=$clinicId";
    final response = await http.get(Uri.parse(url),
        headers: {'Authorization': 'Basic $token'});
    print(response.statusCode);
    if (response.statusCode == 200) {
      print("inside 200");
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      var userData = responseData;
      PatientModel user = PatientModel.fromJson(userData);
      result = {'status': true, 'message': 'Successful', 'user': user};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }
}
