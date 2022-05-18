import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:self_love/Controllers/me_controller.dart';
import 'package:self_love/Utils/api.dart';
import 'package:self_love/Views/event_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_landing_page.dart';
import 'medication_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final String oneSignalAppId = "da6740c3-1a6d-4413-9631-5d32763713e6";
  Timer? _timer;
  final MeController meController = Get.put(MeController());
  int _selectedIndex = 0;
  late String _title;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Fitness',
      style: optionStyle,
    ),
    Text(
      'Index 1: Events',
      style: optionStyle,
    ),
    Text(
      'Index 2: Medication',
      style: optionStyle,
    ),
  ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  initState() {
    super.initState();
    initPlatformState();
    _title = 'Fitness';
  }

  //
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !Navigator.of(context).userGestureInProgress,
      child: Scaffold(
        appBar: new AppBar(
          title: Text(_title),
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Color.fromRGBO(254, 176, 149, 1),
        ),
        drawer: new Drawer(
            child: ListView(
          children: <Widget>[
            Obx(() {
              return ListView.builder(
                  itemCount: meController.meList.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    return UserAccountsDrawerHeader(
                      // currentAccountPicture: CircleAvatar(
                      //   backgroundImage: AssetImage("assets/logo-app.png"),
                      //
                      // ),
                      accountName: Text(meController.meList[index].name,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),),
                      accountEmail: Text(meController.meList[index].email),
                      decoration: new BoxDecoration(color: Color.fromRGBO(254, 176, 149, 1)),
                    );
                  });
            }),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: ListTile(
                title: Text('Home'),
                leading: Icon(
                  Icons.home,
                  color: Color.fromRGBO(254, 176, 149, 1),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                // alertScreen().showAlertUnSubDialog(
                //     context, 'Do you really want to unsubscribe');
              },
              child: ListTile(
                title: Text('Unsubscribe'),
                leading: Icon(
                  Icons.unsubscribe,
                  color: Color.fromRGBO(254, 176, 149, 1),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences
                    .getInstance();
                try {
                  var response =
                  await API().logout();
                  print(response);
                  if (response['status'] == false) {
                    _timer?.cancel();
                    await EasyLoading.showError(
                        response['message']);
                  } else {
                    _timer?.cancel();
                    await EasyLoading.showSuccess(
                        response['message']);
                    prefs.remove("token");
                    Navigator.of(context).pushReplacementNamed('/login');
                  }
                }
                catch (e) {
                  _timer?.cancel();
                  await EasyLoading.showError(
                      e.toString());
                }
              },
              child: ListTile(
                title: Text('Logout'),
                leading: Icon(
                  Icons.logout,
                  color: Color.fromRGBO(254, 176, 149, 1),
                ),
              ),
            ),
          ],
        )),
        body: new IndexedStack(
          index: _selectedIndex,
          children: <Widget>[HomeLanding(), EventPage(), MedicationScreen()],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Fitness',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Calender',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.clinicMedical),
              label: 'Meditation',
            ),
          ],
          currentIndex: _selectedIndex,
          showUnselectedLabels: true,
          selectedItemColor: Colors.pinkAccent,
          onTap: onTabTapped,
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          {
            _title = 'Fitness';
          }
          break;
        case 1:
          {
            _title = 'Calender';
          }
          break;
        case 2:
          {
            _title = 'Meditation';
          }
          break;
      }
    });
  }

  // ONE Signal Configuration

  Future<void> initPlatformState() async {
    OneSignal.shared.setAppId(oneSignalAppId);
  }
}
