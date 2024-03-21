import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class admindata extends StatefulWidget {
  const admindata({super.key, });

  @override
  State<admindata> createState() => _admindataState();
}

class _admindataState extends State<admindata> {
  final auth = FirebaseFirestore.instance ;
  final fireStore = FirebaseFirestore.instance.collection('dataupload').snapshots();
  CollectionReference ref = FirebaseFirestore.instance.collection('dataupload');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(Icons.airplane_ticket_outlined,color: Colors.deepPurple,size: 40,)
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
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
              if(snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }

              if(snapshot.hasError) {
                return const Text("error");
              }

           return Expanded(child: ListView.builder(
               itemCount: snapshot.data!.docs.length,
               itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: const BorderSide(color: Colors.grey, width: 1)
                ),
                child:  Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
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
                              style:const TextStyle(color: Colors.deepPurpleAccent,fontSize: 20,fontWeight: FontWeight.bold),),
                            Row(
                              children: [
                                Text(snapshot.data!.docs[index]['Flightdate'].toString(),
                                  style: const TextStyle(color: Colors.black,fontSize: 15),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      ),
                      const Divider(color: Colors.deepPurple,thickness: 2,indent: 20,endIndent: 20,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(snapshot.data!.docs[index]['selectedDestinationAirport'].toString(),
                            style: const TextStyle(color: Colors.black,fontSize: 17),
                            ),
                            const Row(
                              children: [
                                //Icon(Icons.flight_takeoff_rounded,size: 30,)
                                Text("Duration",style: TextStyle(fontSize: 17,color: Colors.black),),
                                Icon(Icons.flight_takeoff_rounded,color: Colors.deepPurple,)
                              ],
                            ),
                            Row(
                              children: [
                                Text(snapshot.data!.docs[index]['selectedOriginAirport'].toString(),
                                style: const TextStyle(color: Colors.black,fontSize: 17),
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
                              style: const TextStyle(color: Colors.black,fontSize: 16),
                            ),
                            Row(
                              children: [
                                //Icon(Icons.p),
                                const Text("₹"),
                                Text(snapshot.data!.docs[index]['Flightprice'].toString(),
                                  style: const TextStyle(color: Colors.black,fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Center(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                ref.doc(snapshot.data!.docs[index]['id'].toString()).delete();
                              },
                              icon: Icon( // <-- Icon
                                Icons.delete_outline_outlined,
                                size: 24.0,
                              ),
                              label: Text('DELETE'), // <-- Text
                            ),
                          ),
                        ],
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

