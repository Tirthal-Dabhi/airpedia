import 'package:airpedia/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class addticket extends StatefulWidget {
  const addticket({Key? key}) : super(key: key);

  @override
  State<addticket> createState() => _addticketState();
}

class _addticketState extends State<addticket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Add Ticket",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Center(
        ),
      ),
    );
  }
}
