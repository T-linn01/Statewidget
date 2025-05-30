import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: Scaffold(
        appBar: AppBar(
          title: Text("My App"),
        ),
        body: Center(child: Text(
          "Welcome",
          style: TextStyle(fontSize: 20),
        ),
        ),
        drawer:Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                  accountName: Text("Vu Thuy Linh"),
                  accountEmail: Text("vlinh3989@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.orange,
                  radius: 40,
                  backgroundImage: NetworkImage(
                    "https://i.pinimg.com/736x/bb/64/a6/bb64a6fbcc9cb74bde1f171112e548b1.jpg",
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home), title: Text("Home"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.settings), title: Text("Settings"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.contacts), title: Text("Contacts"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
        ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.indigo,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.55),
          selectedFontSize: 18,
          unselectedFontSize: 15,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.mail),
              label: 'Messenger',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.video_call),
              label: 'Video Call',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.call),
              label: 'Voice Call',
            ),
          ],
        ),
      // Scaffold
      ), // MaterialApp
    );
  }
}