
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rinkesh/dashboard/dashboard.dart';
import 'package:rinkesh/utils/loader.dart';

class LoginController extends GetxController{

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();


  getValidation(String email,password){
    showLoader();
    if(email == "tech@knowello.com" && password =="tech123" ){
      Get.offAll(DashBoard());
      closeLoader();
    }
    else{
      closeLoader();
      Get.snackbar("Unauthorized", "Invalid Email or password");
    }
      //Consider tech@knowello.com as a authenticated username
      //Consider tech123 as the right password
  }
}