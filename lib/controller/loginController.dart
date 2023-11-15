

import 'package:doctocms/Services/webservice.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();

  Future<Map<String, dynamic>> login(
      String username, String password, String clinicId) async {
    final results = await Webservice().login(username, password, clinicId);
    return results;
  }
}