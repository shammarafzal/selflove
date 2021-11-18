import 'package:flutter/material.dart';
import 'account_screen.dart';
import 'calender_screen.dart';
import 'fitness.dart';
import 'home_landing_page.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !Navigator.of(context).userGestureInProgress,
      child: Scaffold(
        appBar: new AppBar(
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Colors.pinkAccent,
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
            TableEventsExample()
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
              label: 'Medication',
            ),
          ],
          currentIndex: _selectedIndex,
          showUnselectedLabels: true,
          selectedItemColor: Colors.pinkAccent,
          onTap: _onItemTapped,
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }
}
