// import 'dart:js_interop';
import 'package:icons_plus/icons_plus.dart';
import 'package:flutter/material.dart';
import 'package:srashti/widgets/coustom_scaffold.dart';

class Signinpage extends StatefulWidget {
  @override
  State<Signinpage> createState() => _SigninpageState();
}

class _SigninpageState extends State<Signinpage> {
  final signinkey = GlobalKey<FormState>();

  var remember = true;
  void signin() {
    if (signinkey.currentState!.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('data processing')));
    }
  }

  String? _validateEmail(value) {
    if (value!.isEmpty) {
      return 'please enter an email';
    }
    RegExp emailRegexp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegexp.hasMatch(value)) {
      return 'enter valid email';
    }
    return null;
  }
  String? _validatePass(value) {
    if (value!.isEmpty) {
      return 'please enter a password';
    }
    return null;
  }


  @override
  Widget build(BuildContext context) {
    return CoustomScaffold(
        title: Text(
          'Back',
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: SizedBox(
                  height: 10,
                )),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0))),
                child: SingleChildScrollView(
                  child: Form(
                    key: signinkey,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(
                            'WelCome',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: _validateEmail,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                                label: Text('Enter Email '),
                                hintText: 'Enter Email',
                                hintStyle: TextStyle(
                                  color: Colors.black26,
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.blueAccent,
                                      width: 3,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.black12,
                                      width: 3,
                                    ))),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            obscureText: true,
                            validator: _validatePass,
                            decoration: InputDecoration(
                                label: Text('Enter Password '),
                                hintText: 'Enter Password',
                                hintStyle: TextStyle(
                                  color: Colors.black26,
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.blueAccent,
                                      width: 3,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.black12,
                                      width: 3,
                                    ))),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: remember,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        remember = value!;
                                      });
                                    },
                                    activeColor: Colors.lightBlue,
                                  ),
                                  const Text(
                                    'Rmemeber me',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                child: Text(
                                  'Forgot password',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.blue),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                signin();
                              },
                              child: Text(
                                'Sigin',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.grey,
                                  thickness: 1.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  'Sign Up With',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.grey,
                                  thickness: 1.0,
                                ),
                              ),
                            ],
                          ),
SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                          Icon(Bootstrap.facebook, size: 50,color: Colors.blue,),
                          Icon(Bootstrap.google, size: 50 ,color: Colors.red,),
                          Icon(Bootstrap.github, size: 50),
                          Icon(Bootstrap.apple, size: 50),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

          ],
        ));
  }
}
