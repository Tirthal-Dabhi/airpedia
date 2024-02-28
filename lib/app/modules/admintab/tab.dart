
import 'package:airpedia/app/modules/admintab/addticket.dart';
import 'package:airpedia/app/modules/admintab/admindata.dart';
import 'package:airpedia/app/modules/admintab/setting.dart';
import 'package:airpedia/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class admintab extends StatefulWidget {
  const admintab({Key? key}) : super(key: key);

  @override
  State<admintab> createState() => _admintabState();
}

class _admintabState extends State<admintab> {
  List pages = [
    addticket(),
    admindata(),
    asetting(),
  ];
  int currentIndex=0;
  void onTap(int index){
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.deepPurpleAccent,
        unselectedItemColor: Colors.black26,
        showUnselectedLabels: false,
        showSelectedLabels: true,
        elevation: 0,
        items:  [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined,color: Colors.deepPurpleAccent,size: 35),label:'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.airplane_ticket_outlined,color: Colors.deepPurpleAccent,size: 35),label:'TicketData'),
          BottomNavigationBarItem(icon: Icon(Icons.settings_outlined,color: Colors.deepPurpleAccent,size: 35),label:'Setting'),
        ],
      ),
    );
  }
}
