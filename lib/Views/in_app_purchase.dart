import 'package:flutter/material.dart';
import 'package:self_love/Components/customButton.dart';
import 'package:self_love/Settings/SizeConfig.dart';

class InAppPurchase extends StatefulWidget {
  const InAppPurchase({Key? key}) : super(key: key);

  @override
  _InAppPurchaseState createState() => _InAppPurchaseState();
}

class _InAppPurchaseState extends State<InAppPurchase> {
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
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Center(
                            child: Text(
                              'Subscribe Now',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 22),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Center(
                            child: Text(
                              '\$ 7.99',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 36),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Center(
                            child: Text(
                              'Get Unlimited Access to:',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 22),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            '- Daily Challenges\n- 24/7 girl talk\n- Positive quotes and mantras\n- Advice from qualified professionals\n- Reflection and planning space for you\n- My personal journey with self-love and confidence tips\n- A safe and positive forum to interact with other on the same journey',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                          child: CustomButton(title: 'Subscribe', onPress: (){
                            Navigator.of(context).pushReplacementNamed('/home');
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
                    // Navigator.of(context).pushReplacementNamed('signup_screen');
                  },
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'For More Informatio, See Our ',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                      children: <TextSpan>[
                        TextSpan(text: 'Terms ', style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: 'and '),
                        TextSpan(text: 'Privacy Policy', style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
