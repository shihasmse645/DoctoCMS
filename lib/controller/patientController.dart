import 'package:doctocms/Services/webservice.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';


class PatientController extends GetxController{
  static PatientController get to => Get.find();

  Future<Map<String, dynamic>> patient(String userId, String clinicId) async {
    final results = await Webservice().patient(userId, clinicId);
    return results;
  }
  
}