import 'package:airpedia/main.dart';
import 'package:flutter/material.dart';

class about extends StatefulWidget {
  const about({Key? key}) : super(key: key);

  @override
  State<about> createState() => _aboutState();
}

class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("About us",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Center(
                child: Text('Ticket Reservation System',
                  style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              ),
            ),
            Center(
              child: Container(
                height: 300,
                width: 350,
                child: Text('Online Airline reservation system is to allocate an option to customers to book the tickets online and to check the testimony online'
              'This system will help company to dispose of the flight tickets online. Before the ARS people find many problems that the people come to the airport and save their seats and as well as inquire the time of flight from representative...To overcome these difficulties the Online Airline Reservation System was introduced.'
                ,style: TextStyle(fontSize: 16),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
