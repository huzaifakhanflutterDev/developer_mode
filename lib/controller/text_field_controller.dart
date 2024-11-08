import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MyTextFieldController extends GetxController {
  var fields = RxList<TextEditingController>([TextEditingController()]);

  void addFields() {
    fields.add(TextEditingController());
  }

  void removeField(int index) {
    if (index >= 0 && index < fields.length) {
      fields[index].dispose();
      fields.removeAt(index);
    }
  }
}
