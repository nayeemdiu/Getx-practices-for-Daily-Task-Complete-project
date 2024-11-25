import 'package:get/get.dart';

import '../model/UserModel.dart';

class FormController extends GetxController {
  var name = ''.obs;
  var age = 0.obs;
  var address = ''.obs;

  var userList = <UserData>[].obs;

  void saveDataToDatabase() {
    var newUser = UserData(
      name: name.value,
      age: age.value,
      address: address.value,
    );
    userList.add(newUser);

    // Clear form fields after saving
    name.value = '';
    age.value = 0;
    address.value = '';
  }


  void updateUserData(int index) {
    var user = userList[index];
    name.value = user.name;
    age.value = user.age;
    address.value = user.address;
    userList.removeAt(index);

  }



  void deleteUserData(int index) {
    userList.removeAt(index);
  }


}
