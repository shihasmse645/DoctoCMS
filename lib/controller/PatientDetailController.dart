import 'package:doctocms/Services/webservice.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';


class PatientDetailController extends GetxController{
  static PatientDetailController get to => Get.find();

  Future<Map<String, dynamic>> Details( String id, String userId, String clinicId) async {
    final results = await Webservice().PatientDatail(id,userId, clinicId);
    return results;
  }
  
}