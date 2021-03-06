import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../Components/customButton.dart';
import '../Components/customTextField.dart';
import 'package:self_love/Settings/SizeConfig.dart';
import 'package:self_love/Utils/api.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Timer? _timer;
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _passwordConfirm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Color.fromRGBO(254, 176, 149, 0.3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: SizeConfig.screenHeight * 0.75,
                    child: ListView(
                      children: [
                        Image.asset(
                          'assets/self_logo.png',
                          width: 100,
                          height: 100,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 22),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                'Name',
                                style: TextStyle(color: Colors.grey),
                              )),
                        ),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),
                            child: CustomTextField(
                              controller: _name,
                            )),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                'Email',
                                style: TextStyle(color: Colors.grey),
                              )),
                        ),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),
                            child: CustomTextField(
                              controller: _email,
                            )),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                'Password',
                                style: TextStyle(color: Colors.grey),
                              )),
                        ),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),
                            child: CustomTextField(
                              controller: _password,
                              isPassword: true,
                            )),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                'Confirm Password',
                                style: TextStyle(color: Colors.grey),
                              )),
                        ),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),
                            child: CustomTextField(
                              controller: _passwordConfirm,
                              isPassword: true,
                            )),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: CustomButton(
                            title: 'Contine',
                            onPress: () async {
                              try {
                                await EasyLoading.show(
                                  status: 'loading...',
                                  maskType: EasyLoadingMaskType.black,
                                );
                                var response = await API().register(
                                    _name.text,
                                    _email.text,
                                    _password.text,
                                    _passwordConfirm.text);

                                if (response['status'] == false) {
                                  _timer?.cancel();
                                  await EasyLoading.showError(
                                      response['message']);
                                } else {
                                  _timer?.cancel();
                                  await EasyLoading.showSuccess(
                                      response['message']);
                                  Navigator.of(context).pushReplacementNamed(
                                      '/verify_code',
                                      arguments: {'token': _email.text});
                                }
                              }
                              catch(e){
                                _timer?.cancel();
                                await EasyLoading.showError(
                                    'Something Went Wrong');
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed('/login');
                  },
                  child: Text(
                    'Already have an account? Login here.',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
