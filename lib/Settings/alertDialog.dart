import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:self_love/Components/customButton.dart';


class alertScreen{
  showAlertDialog(BuildContext context,String msg) {
    Timer timer = Timer(Duration(milliseconds: 1000), (){
      Navigator.of(context, rootNavigator: true).pop();
    });
    showDialog(
        context: context,
        builder: (BuildContext context) => Theme(
          data: ThemeData.dark(),
          child: CupertinoAlertDialog(
            title: new Text("Self Love",style: TextStyle(fontSize: 20,color: Colors.pinkAccent,),),
            content: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(msg,style: TextStyle(fontSize: 14,color: Colors.white,),textAlign: TextAlign.center,),
            ),
          ),
        )
    ).then((value){
      timer.cancel();
      timer = null!;
    });
  }
  showSignupAlertDialog(BuildContext context,String msg) {
    Timer timer = Timer(Duration(milliseconds: 1000), (){
      Navigator.of(context).popUntil((route) => route.isFirst);
    });
    showDialog(
        context: context,
        builder: (BuildContext context) => Theme(
          data: ThemeData.dark(),
          child: CupertinoAlertDialog(
            title: new Text("Al-Haram",style: TextStyle(fontSize: 20, color: Colors.pinkAccent,),),
            content: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(msg,style: TextStyle(fontSize: 14,color: Colors.white,),textAlign: TextAlign.center,),
            ),
          ),
        )
    ).then((value){
      timer.cancel();
      timer = null!;
    });
  }
  showSigninAlertDialog(BuildContext context,String msg) {
    Timer timer = Timer(Duration(milliseconds: 1000), (){
      Navigator.of(context)
          .pushNamedAndRemoveUntil('bottomNavBar', (Route<dynamic> route) => false);
    });
    showDialog(
        context: context,
        builder: (BuildContext context) => Theme(
          data: ThemeData.dark(),
          child: CupertinoAlertDialog(
            title: new Text("AL-Haram",style: TextStyle(fontSize: 20,color: Colors.pinkAccent,),),
            content: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(msg,style: TextStyle(fontSize: 14,color: Colors.white,),textAlign: TextAlign.center,),
            ),
          ),
        )
    ).then((value){
      timer.cancel();
      timer = null!;
    });
  }
  showForgotAlertDialog(BuildContext context,String msg) {
    Timer timer = Timer(Duration(milliseconds: 1000), (){
      // Navigator.push(
      //   context,
      //   new MaterialPageRoute(
      //     builder: (context) => new PinVerify(),
      //   ),
      // );
    });
    showDialog(
        context: context,
        builder: (BuildContext context) => Theme(
          data: ThemeData.dark(),
          child: CupertinoAlertDialog(
            title: new Text("AL-Haram",style: TextStyle(fontSize: 20,color: Colors.pinkAccent),),
            content: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(msg,style: TextStyle(fontSize: 14,color: Colors.white,),textAlign: TextAlign.center,),
            ),
          ),
        )
    ).then((value){
      timer.cancel();
      timer = null!;
    });
  }
  showAlertBtnDialog(BuildContext context,String msg) {
    // Timer timer = Timer(Duration(milliseconds: 1000), (){
    //   Navigator.of(context, rootNavigator: true).pop();
    // });
    showDialog(
        context: context,
        builder: (BuildContext context) => Theme(
          data: ThemeData.dark(),
          child: CupertinoAlertDialog(
            title: new Text("Self Love",style: TextStyle(fontSize: 20,color: Colors.pinkAccent,),),
            content: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(msg,style: TextStyle(fontSize: 14,color: Colors.white,),textAlign: TextAlign.center,),
            ),
            actions: [
              CustomButton(title: 'Done', onPress: (){
                Navigator.of(context, rootNavigator: true).pop();
              })
            ],
          ),
        )
    ).then((value){

    });
  }
  showAlertUnSubDialog(BuildContext context,String msg) {
    // Timer timer = Timer(Duration(milliseconds: 1000), (){
    //   Navigator.of(context, rootNavigator: true).pop();
    // });
    showDialog(
        context: context,
        builder: (BuildContext context) => Theme(
          data: ThemeData.dark(),
          child: CupertinoAlertDialog(
            title: new Text("Self Love",style: TextStyle(fontSize: 20,color: Colors.pinkAccent,),),
            content: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(msg,style: TextStyle(fontSize: 14,color: Colors.white,),textAlign: TextAlign.center,),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(title: 'Yes', onPress: (){
                  Navigator.of(context, rootNavigator: true).pop();
                }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(title: 'No', onPress: (){
                  Navigator.of(context, rootNavigator: true).pop();
                }),
              )
            ],
          ),
        )
    ).then((value){

    });
  }
}