import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:self_love/Components/customButton.dart';
import 'package:self_love/Settings/SizeConfig.dart';
import 'package:self_love/Utils/api.dart';

class VerificationCode extends StatefulWidget {
  @override
  _VerificationCodeState createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  Timer? _timer;
  TextEditingController controller = TextEditingController(text: "");
  String thisText = "";
  int pinLength = 4;
  bool hasError = false;
  late String errorMessage;
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Color.fromRGBO(254, 176, 149, 0.3),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: Text(
                            'Verification Code',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 22),
                          ),
                        ),
                      ),
                      Text(
                          'Verify your account by entering the 4 digit code we sent to your email'),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            arguments['token'],
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )),
                      Container(
                        height: 30,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Enter Code',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )),
                      Container(
                        height: 10,
                      ),
                      Center(
                        child: Container(
                          height: 100.0,
                          child: PinCodeTextField(
                            autofocus: true,
                            controller: controller,
                            hideCharacter: false,
                            highlight: true,
                            highlightColor: Colors.grey,
                            defaultBorderColor: Colors.grey,
                            hasTextBorderColor: Colors.grey,
                            highlightPinBoxColor:
                                Color.fromRGBO(246, 247, 249, 1),
                            maxLength: pinLength,
                            hasError: hasError,
                            onTextChanged: (text) {
                              setState(() {
                                hasError = false;
                              });
                            },
                            pinBoxWidth: SizeConfig.screenWidth / 6,
                            pinBoxHeight: 64,
                            wrapAlignment: WrapAlignment.spaceAround,
                            pinBoxDecoration: ProvidedPinBoxDecoration
                                .defaultPinBoxDecoration,
                            pinTextAnimatedSwitcherTransition:
                                ProvidedPinBoxTextAnimation.scalingTransition,
                            pinBoxColor: Color.fromRGBO(246, 247, 249, 1),
                            pinTextAnimatedSwitcherDuration:
                                Duration(milliseconds: 300),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                        child: CustomButton(
                            title: 'Continue',
                            onPress: () async {
                              try{
                              await EasyLoading.show(
                                status: 'loading...',
                                maskType: EasyLoadingMaskType.black,
                              );
                              var response = await API().verifyEmailToken(
                                  controller.text, arguments['token']);
                              print(arguments['token']);
                              if (response['status'] == false) {
                                _timer?.cancel();
                                await EasyLoading.showError(
                                    response['message']);
                              }
                              else {
                                _timer?.cancel();
                                await EasyLoading.showSuccess(
                                    response['message']);
                                Navigator.of(context)
                                    .pushReplacementNamed('/login');
                              }
                              }
                              catch(e){
                                _timer?.cancel();
                                await EasyLoading.showError(
                                    'Something Went Wrong');
                              }
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
