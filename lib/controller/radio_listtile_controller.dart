import 'package:get/get.dart';

class RadioController extends GetxController {
  var radio = 0.obs;

  void selectedOption(value) {
    radio.value = value;
  }

  var currentStatus = "Available".obs;

  void toggleStatus(String newValue) {
    currentStatus.value = newValue;
  }

  var selectedOptions = "One".obs;

  List<String> names = [
    "Option 1",
    "Option 2",
    "Option 3",
    "Option 4",
  ];

  List<String> get filteredNames {
    if (selectedOptions.value == "One") {
      return names.sublist(0, 1);
    } else if (selectedOptions.value == "Two") {
      return names.sublist(0, 2);
    } else if (selectedOptions.value == "Three") {
      return names.sublist(0, 3);
    } else {
      return names;
    }
  }

  void selectOption(String value) {
    selectedOptions.value = value;
    radio.value = 0;
  }
}
