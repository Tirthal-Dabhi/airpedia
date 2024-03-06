import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class userdata extends StatefulWidget {
  const userdata({Key? key}) : super(key: key);

  @override
  State<userdata> createState() => _userdataState();
}

class _userdataState extends State<userdata> {
  final auth = FirebaseFirestore.instance;

  final fireStore = FirebaseFirestore.instance.collection('ticket_transactions')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: Column(
          children: [
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
                                          snapshot.data!
                                              .docs[index]['user_name']
                                              .toString(),
                                          style: TextStyle(
                                              color: Colors.deepPurpleAccent,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),),
                                        Row(
                                          children: [
                                            Text(snapshot.data!
                                                .docs[index]['arriving_date']
                                                .toString(),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 17),
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
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        Text('Flightname:-', style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17),),
                                        Text(snapshot.data!
                                            .docs[index]['ticket']['airline_name']
                                            .toString(),
                                          style: TextStyle(
                                            color: Colors.black, fontSize: 17,),
                                        ),
                                        SizedBox(width: 20,),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Text('Seatno:-', style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 17),),
                                              Text(snapshot.data!
                                                  .docs[index]['selected_seat']
                                                  .toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17),
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
                                          .spaceAround,
                                      children: [
                                        Text(snapshot.data!
                                            .docs[index]['destination']['airport_destination_name']
                                            .toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17),
                                        ),
                                        Row(
                                          children: [
                                            //Icon(Icons.flight_takeoff_rounded,size: 30,)
                                            Text("Duration", style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.black),),
                                            Icon(Icons.flight_takeoff_rounded,
                                              color: Colors.deepPurple,)
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(snapshot.data!
                                                .docs[index]['destination']['destination_name']
                                                .toString(),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 17),
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
                                        Text('Country:-', style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17),),
                                        Text(snapshot.data!
                                            .docs[index]['destination']['country']
                                            .toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17),
                                        ),
                                        SizedBox(width: 10,),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Text('Price:-', style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 17),),
                                              Text(snapshot.data!
                                                  .docs[index]['total']
                                                  .toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17),

                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
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
    /////
    // Scaffold(
    //   body: Center(
    //     child: Column(
    //       children: [
    //         TicketWidget(
    //           width: 350,
    //           height: 200,
    //           color: Colors.cyan,
    //           isCornerRounded: true,
    //           padding: EdgeInsets.all(20),
    //           child: Column(
    //             children: [
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                 children: [
    //                   Text("name"),
    //                   Row(
    //                     children: [
    //                       Text("date"),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //               Column(
    //                 children: [
    //                   Text("flightname"),
    //                 ],
    //               ),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}