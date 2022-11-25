import 'dart:convert';

import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sportapp/api/api.dart';

class LoginController extends GetxController {
  ApiManager apiManager = ApiManager();

  @override
  void onInit() {
    super.onInit();
    login();
  }

  String? phoneNumber;
  bool? status;
  String? message;
  login({String? phoneNumber}) async {
    log('the value $phoneNumber');
    var _resData = await apiManager.loginApi(
      mobileNumber: phoneNumber,
    );
    log(_resData);

    status = json.decode(_resData)["status"];
    message = json.decode(_resData)["message"];
    update();
  }
}
