import 'package:flutter/material.dart';
import 'account_screen.dart';
import 'calender_screen.dart';
import 'home_landing_page.dart';
import 'medication_screen.dart';


class HomePage extends StatefulWidget {

  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
      'Index 1: Calender',
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
  initState(){
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
          backgroundColor: Color.fromRGBO(254,176,149, 1),
        ),
        drawer: new Drawer(
            child: ListView(
              children: <Widget>[
                FutureBuilder(
                  // future:  Utils().fetchuser(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return UserAccountsDrawerHeader(

                          accountName: Text('ss',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          accountEmail: Text('ss'),
                          decoration: new BoxDecoration(color: Colors.pinkAccent),
                        );
                      }
                      return UserAccountsDrawerHeader(
                        currentAccountPicture: CircleAvatar(
                          backgroundImage: AssetImage("assets/self_logo.png"),

                        ),
                        accountName: Text('Ammar',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        accountEmail: Text('ammarafzal075@gmail.com'),
                        decoration: new BoxDecoration(color: Colors.pinkAccent),
                      );
                    }
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: ListTile(
                    title: Text('Home'),
                    leading: Icon(Icons.home, color: Colors.pinkAccent),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) =>
                              UpdateProfile()
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text('Profile'),
                    leading: Icon(Icons.person, color: Colors.pinkAccent),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed('login');
                  },
                  child: ListTile(
                    title: Text('Logout'),
                    leading: Icon(Icons.logout, color: Colors.pinkAccent),
                  ),
                ),
              ],
            )
        ),
        body: new IndexedStack(
          index: _selectedIndex,
          children: <Widget>[
            HomeLanding(),
            TableEventsExample(),
            MedicationScreen()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Fitness',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_offer_outlined),
              label: 'Calender',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_rounded),
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
      switch(index) {
        case 0: { _title = 'Fitness'; }
        break;
        case 1: { _title = 'Calender'; }
        break;
        case 2: { _title = 'Meditation'; }
        break;
      }
    });
  }
}
