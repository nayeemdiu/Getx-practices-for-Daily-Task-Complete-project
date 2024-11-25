import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class LoginController extends GetxController{

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;


void login() async {
     final response = await post(Uri.parse("https://reqres.in/api/login"),
     body: {
       'email' : emailController.value.text,
       'password': passwordController.value.text

     });

     var data = jsonDecode(response.body);
     print(data);
     if(response.statusCode == 200){
        print("sucessful");
       Get.snackbar(
         'Message',  // Title of the SnackBar
         "=Sucessful",    // Message of the SnackBar
         snackPosition: SnackPosition.BOTTOM, // Position of the SnackBar
         duration: Duration(seconds: 3), // Duration of the SnackBar
       );

     }else{
       Get.snackbar("error ", "sucessful");

     }

}

}
