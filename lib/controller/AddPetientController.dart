import 'dart:io';
import 'package:doctocms/Services/webservice.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AddPatientController extends GetxController {
  static AddPatientController get to => Get.find();

  Future<Map<String, dynamic>> addPatient(
      File profilePicture,
      String patientName,
      String mobileNo,
      String age,
      String email,
      String address,
      String dateOfbirth,
      String gender,
      String userId,
      String clinicId) async {
    final results = await Webservice().addPatient(profilePicture, patientName,
        mobileNo, age, email, address, dateOfbirth, gender, userId, clinicId);
    return results;
  }
}