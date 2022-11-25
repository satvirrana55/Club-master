import 'dart:convert';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sportapp/api/api.dart';
import 'package:sportapp/module/authentication_modules/verify_otp_module.dart';
import 'package:sportapp/module/get_city_list_module.dart';
import 'package:sportapp/module/get_state_list_module.dart';

class VerifyOtpController extends GetxController {
  ApiManager apiManager = ApiManager();

  @override
  void onInit() {
    super.onInit();
    verifyOtp();
    getStateList();
  }

  String? phoneNumber;
  bool? status;
  String? message;
  String? token;

  VerifyOtpModule? verifyOtpModule;

  verifyOtp({String? otp}) async {
    log(' res verfy otp api log');
    var _resData =
        await apiManager.verifyOtp(mobileNumber: phoneNumber, otp: otp);
    log('$_resData');
    status = json.decode(_resData)["status"];
    message = json.decode(_resData)["message"];
    token = json.decode(_resData)["token"];
    update();
  }

  late List stateListData = [];
  late List stateListDataIndex = [];
  StateListModule? stateListModule;
  late List<StateListModule> stateList;

  getStateList() async {
    stateListData.clear();
    stateList.clear();
    await apiManager.getStateListApi().then((value) {
      stateList = value;
      log('get State List :--- ${stateList[0].name}');
    });

    stateListModule = await stateList[0];
    for (var i = 0; i < stateList.length; i++) {
      await getCityList(stateListModule!.id);
      stateListData.add(stateListModule!.name);
    }

    update();
  }

  late List<CityListModule> cityList;
  CityListModule? cityListModule;
  late List cityListData = [];
  late List cityListDataIndex = [];

  getCityList(id) async {
    log('Get city list');
    await apiManager.getCityListApi(id).then((value) {
      cityList = value;
    });
    cityListModule = cityList[0];
    if (cityListData.isEmpty) {
      for (var i = 0; i < cityList.length; i++) {
        cityListData.add(cityListModule!.name);
        cityListDataIndex.add(cityListModule!.id);
      }
    } else if (cityListData.isNotEmpty) {
      for (var i = 0; i < cityListData.length; i++) {
        if (cityListModule!.name == cityListData[i]) {
        } else if (cityListModule!.name != cityListData[i]) {
          cityListData.add(cityListModule!.name);
          cityListDataIndex.add(cityListModule!.id);
        }
      }
    } else {}

    log('get City List :--- ${cityListData}');

    update();
  }

  getdata() async {
    CityListModule? cityListModule;
    await apiManager.getCityListApi(1).then(
          (value) => cityListModule = value[0],
        );
    log('get State List${cityListModule!.name}');
  }
}
