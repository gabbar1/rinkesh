import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rinkesh/login/login_controller.dart';

class LoginView extends StatefulWidget {


  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  Timer _debounce;
  String  validator;
  _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {

      validator = "Invalid Email";
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  final _formKeyPassword = GlobalKey<FormState>();
  LoginController loginController = Get.put(LoginController());
  bool _isValid = false;
  Pattern pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(160.0),
        child: AppBar(
          backgroundColor:Color(0xFF2C3BC7),
          title: Text('Login'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(180),
            ),
          ),
        ),
      ),
        body: Container(



      margin: EdgeInsets.only(left: 20,right: 20,top: 100),
        child: Column(children: [
          Form(
            key: _formKey,
            onChanged: () {
              final isValid = _formKey.currentState.validate();
              if (_isValid != isValid) {
                setState(() {
                  _isValid = isValid;
                });
              }
            },
            child: TextFormField(
              controller: loginController.email,
                decoration: new InputDecoration(
                  hintText: "Enter Email",
                    enabledBorder: const OutlineInputBorder(

                      borderSide: const BorderSide(color: Color(0xFF2C3BC7), width: 0.0),
                    ),
                    border: const OutlineInputBorder(),
                    labelStyle: new TextStyle(color: Color(0xFF2C3BC7)),

                ),
                validator: (x) => RegExp(pattern).hasMatch(x) ? null : 'Invalid Email'

            ),
          ),
          SizedBox(height: 10,),
          Form(
            onChanged: () {
              final isValid = _formKeyPassword.currentState.validate();
              if (_isValid != isValid) {
                setState(() {
                  _isValid = isValid;
                });
              }
            },
            key: _formKeyPassword,
            child: TextFormField(
              controller: loginController.password,
              obscureText:true,
                decoration: new InputDecoration(
                  hintText: "Enter Password",
                  enabledBorder: const OutlineInputBorder(

                    borderSide: const BorderSide(color: Color(0xFF2C3BC7), width: 0.0),
                  ),
                  border: const OutlineInputBorder(),
                  labelStyle: new TextStyle(color: Color(0xFF2C3BC7)),

                ),
                validator: (x) => x.length > 5 ? null : 'Too short'

            ),
          ),
          SizedBox(height: 10,),
          InkWell(
            onTap: (){
              loginController.getValidation(loginController.email.text,loginController.password.text);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFF2C3BC7),
                borderRadius: BorderRadius.all(Radius.circular(25))
              ),
              height: 50,

              child: Center(child: Text("Login",style: TextStyle(color: Colors.white),)),),
          )
        ],)
    ));
  }
}

