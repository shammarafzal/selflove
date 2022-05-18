import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../Components/customButton.dart';
import '../Components/customTextField.dart';
import 'package:self_love/Settings/SizeConfig.dart';
import 'package:self_love/Utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Timer? _timer;
  final _email = TextEditingController();
  final _password = TextEditingController();
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
                    height: SizeConfig.screenHeight * 0.65,
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
                              'Sign In',
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
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: CustomButton(
                            title: 'Login',
                            onPress: () async {
                              final SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              await EasyLoading.show(
                                status: 'loading...',
                                maskType: EasyLoadingMaskType.black,
                              );
                              var response = await API()
                                  .login(_email.text, _password.text);
                              if (response['status'] == false) {
                                // alertScreen().showToast(response['message']);
                                _timer?.cancel();
                                await EasyLoading.showError(
                                    response['message']);
                              } else {
                                prefs.setBool('isLoggedIn', true);
                                prefs.setString('token', response['token']);
                                prefs.setInt('id', response['user']['id']);
                                _timer?.cancel();
                                await EasyLoading.showSuccess(
                                    response['message']);
                                Navigator.of(context)
                                    .pushReplacementNamed('/home');
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
                    Navigator.of(context).pushReplacementNamed('/signup');
                  },
                  child: Text(
                    'Don\'t have an account? Register here.',
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
