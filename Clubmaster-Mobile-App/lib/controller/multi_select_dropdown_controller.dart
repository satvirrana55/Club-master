import 'package:get/get.dart';

class SelectDropDownControler extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  List<String> _selectedItems = [];
  List<String>? get selectedItems => _selectedItems;
  bool isHaveItem(String value) => _selectedItems.contains(value);
  addItem(String value) {
    if (!isHaveItem(value)) {
      _selectedItems.add(value);

      update();
    }
    update();
  }

  removeItem(String value) {
    if (isHaveItem(value)) {
      _selectedItems.remove(value);
      update();
    }
    update();
  }
}
