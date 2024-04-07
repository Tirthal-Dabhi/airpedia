import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class userdata extends StatefulWidget {
  const userdata({Key? key}) : super(key: key);

  @override
  State<userdata> createState() => _userdataState();
}

class _userdataState extends State<userdata> {
  final auth = FirebaseFirestore.instance;

  final fireStore = FirebaseFirestore.instance.collection('ticket_transactions').snapshots();

  CollectionReference ref = FirebaseFirestore.instance.collection('ticket_transactions');

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("User Details",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
          ),
          backgroundColor: Colors.deepPurple,
        ),
        body: Column(
          children: [
            SizedBox(height: 10,),
            StreamBuilder<QuerySnapshot>(
                stream: fireStore,
                builder: (BuildContext contex,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting)
                    return CircularProgressIndicator();

                  if (snapshot.hasError)
                    return Text("error");
                  return Expanded(child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(color: Colors.grey, width: 1)
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Center(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceAround,
                                      children: [
                                        Text(
                                          snapshot.data!.docs[index]['user_name'].toString(),
                                          style: const TextStyle(
                                              color: Colors.deepPurpleAccent,
                                              fontSize: 19,
                                              fontWeight: FontWeight.bold),),
                                        Row(
                                          children: [
                                            Text(snapshot.data!
                                                .docs[index]['arriving_date']
                                                .toString(),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  ),
                                  // Divider(color: Colors.deepPurple,thickness: 2,indent: 20,endIndent: 20,),

                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Flight:-', style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15),),
                                        Text(snapshot.data!
                                            .docs[index]['ticket']['airline_name']
                                            .toString(),
                                          style: TextStyle(
                                            color: Colors.black, fontSize: 15,),
                                        ),
                                        //SizedBox(width: 10,),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Text('Country:-', style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15),
                                              ),
                                              Text(snapshot.data!
                                                  .docs[index]['destination']['country']
                                                  .toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        SizedBox(
                                          child: Text(snapshot.data!
                                              .docs[index]['ticket']['airport_departure_location']
                                              .toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                        ),
                                        SizedBox(width: 15,),
                                        Row(
                                          children: [
                                            //Icon(Icons.flight_takeoff_rounded,size: 30,)
                                            Text("Duration", style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black),),
                                            Icon(Icons.flight_takeoff_rounded,
                                              color: Colors.deepPurple,)
                                          ],
                                        ),
                                        SizedBox(width: 15,),
                                        Row(
                                          children: [
                                            Text(snapshot.data!
                                                .docs[index]['destination']['destination_name']
                                                .toString(),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Seatno:-', style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15),),
                                        Text(snapshot.data!
                                            .docs[index]['selected_seat']
                                            .toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15),
                                        ),

                                        SizedBox(width: 10,),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Text('Price:-', style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15),),
                                              Text(snapshot.data!
                                                  .docs[index]['total']
                                                  .toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.center,
                                  //   children: [
                                  //     Center(
                                  //       child: ElevatedButton.icon(
                                  //         onPressed: () {
                                  //           ref.doc(snapshot.data!.docs[index]['departure_schedule'].toString()).delete();
                                  //         },
                                  //         icon: Icon(
                                  //           Icons.delete_outline_outlined,
                                  //           size: 24.0,
                                  //         ),
                                  //         label: Text('DELETE'),
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                  ),
                  );
                }
            ),

          ],
        ),
      );
  }
}