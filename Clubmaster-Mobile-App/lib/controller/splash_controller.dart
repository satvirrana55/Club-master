import 'package:get/get.dart';
import 'package:sportapp/screens/onboarding/onboarding_screen.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _getClientInformation();
    Future.delayed(const Duration(seconds: 3)).then((value) async {
      Get.to(() => OnBoardingScreen());
    });
  }

  Future<void> _getClientInformation() async {}

  List<String>? _selectedItems;
  List<String>? get selectedItems => _selectedItems;
  bool isHaveItem(String value) => _selectedItems!.contains(value);
  addItem(String value) {
    if (!isHaveItem(value)) {
      _selectedItems!.add(value);
      update();
    }
  }

  removeItem(String value) {
    if (isHaveItem(value)) {
      _selectedItems?.remove(value);
      update();
    }
  }
}
