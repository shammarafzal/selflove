import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:self_love/Components/customButton.dart';
import 'package:self_love/Components/customTextField.dart';
import 'package:self_love/Settings/SizeConfig.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(254,176,149, 0.3),
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
                    height: SizeConfig.screenHeight * 0.55,
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
                            child: CustomTextField(controller: _email,)
                        ),
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
                            child: CustomTextField(controller: _password, isPassword: true,)
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: CustomButton(title: 'Login', onPress: (){
                            Navigator.of(context).pushReplacementNamed('home');
                          },),
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
                  onTap: (){
                    Navigator.of(context).pushReplacementNamed('signup_screen');
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
