import 'package:airpedia/styles/colors.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/utils/app_asset.dart';
import 'package:airpedia/widgets/cards/card_app.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class admindata extends StatefulWidget {
  const admindata({super.key, });

  @override
  State<admindata> createState() => _admindataState();
}

class _admindataState extends State<admindata> {
  final auth = FirebaseFirestore.instance ;
  final fireStore = FirebaseFirestore.instance.collection('dataupload').snapshots();

  @override
  Widget build(BuildContext context) {
    var data;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(Icons.airplane_ticket_outlined,color: Colors.deepPurple,size: 40,)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Ticket Detail",
                  style: TextStyle(color: Colors.deepPurple,fontSize: 30,fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          //SizedBox(height: 10,),
          StreamBuilder<QuerySnapshot>
            (stream: fireStore,
              builder: (BuildContext contex,AsyncSnapshot<QuerySnapshot> snapshot){
              if(snapshot.connectionState == ConnectionState.waiting)
                return CircularProgressIndicator();

              if(snapshot.hasError)
                return Text("error");

           return Expanded(child: ListView.builder(
               itemCount: snapshot.data!.docs.length,
               itemBuilder: (context, index){
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(color: Colors.grey, width: 1)
                ),
                child:  Padding(
                  padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(snapshot.data!.docs[index]['Flightname'].toString(),
                              style:TextStyle(color: Colors.deepPurpleAccent,fontSize: 20,fontWeight: FontWeight.bold),),
                            Row(
                              children: [
                                Text(snapshot.data!.docs[index]['Flightdate'].toString(),
                                  style: TextStyle(color: Colors.black,fontSize: 15),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      ),
                      Divider(color: Colors.deepPurple,thickness: 2,indent: 20,endIndent: 20,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(snapshot.data!.docs[index]['selectedDestinationAirport'].toString(),
                            style: TextStyle(color: Colors.black,fontSize: 17),
                            ),
                            Row(
                              children: [
                                //Icon(Icons.flight_takeoff_rounded,size: 30,)
                                Text("Duration",style: TextStyle(fontSize: 17,color: Colors.black),),
                                Icon(Icons.flight_takeoff_rounded,color: Colors.deepPurple,)
                              ],
                            ),
                            Row(
                              children: [
                                Text(snapshot.data!.docs[index]['selectedOriginAirport'].toString(),
                                style: TextStyle(color: Colors.black,fontSize: 17),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(snapshot.data!.docs[index]['Flighttime'].toString(),
                              style: TextStyle(color: Colors.black,fontSize: 16),
                            ),
                            Row(
                              children: [
                                //Icon(Icons.p),
                                Text("₹"),
                                Text(snapshot.data!.docs[index]['Flightprice'].toString(),
                                  style: TextStyle(color: Colors.black,fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            );
          })
          );

              },
          ),
        ],
      ),
    );
  }
}

