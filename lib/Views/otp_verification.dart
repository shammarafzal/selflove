import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:self_love/Components/customButton.dart';
import 'package:self_love/Settings/SizeConfig.dart';

class VerificationCode extends StatefulWidget {
  final String email;
  VerificationCode({
    required this.email,
  });
  @override
  _VerificationCodeState createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
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
                          padding: const EdgeInsets.only(top: 20,bottom: 20),
                          child: Text(
                            'Verification Code',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 22),
                          ),
                        ),
                      ),
                      Text('Verify your account by entering the 4 digit code we sent to your email'),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(widget.email, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)),
                      Container(height: 30,),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Enter Code', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)),
                      Container(height: 10,),
                      Center(
                        child: Container(
                          height: 100.0,
                          child: PinCodeTextField(
                            autofocus: true,
                            controller: controller,
                            hideCharacter: true,
                            highlight: true,
                            highlightColor: Colors.grey,
                            defaultBorderColor: Colors.grey,
                            hasTextBorderColor: Colors.grey,
                            highlightPinBoxColor: Color.fromRGBO(246, 247, 249, 1),
                            maxLength: pinLength,
                            hasError: hasError,
                            maskCharacter: "*",
                            onTextChanged: (text) {
                              setState(() {
                                hasError = false;
                              });
                            },
                            pinBoxWidth: SizeConfig.screenWidth / 6,
                            pinBoxHeight: 64,
                            wrapAlignment: WrapAlignment.spaceAround,
                            pinBoxDecoration:
                            ProvidedPinBoxDecoration.defaultPinBoxDecoration,
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
                        padding: const EdgeInsets.fromLTRB(10,10,10,20),
                        child: CustomButton(title: 'Continue', onPress: (){
                          Navigator.of(context).pushReplacementNamed('in_app_purchases');
                        }
                        ),
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
