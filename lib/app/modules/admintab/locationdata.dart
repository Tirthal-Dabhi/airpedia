import 'package:airpedia/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class locationdata extends StatefulWidget {
  const locationdata({Key? key}) : super(key: key);

  @override
  State<locationdata> createState() => _locationdataState();
}

class _locationdataState extends State<locationdata> {
  final auth = FirebaseFirestore.instance ;
  final fireStore = FirebaseFirestore.instance.collection('locationdata').snapshots();

  CollectionReference ref = FirebaseFirestore.instance.collection('locationdata');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      StreamBuilder<QuerySnapshot>
      (stream: fireStore,
      builder: (BuildContext contex,AsyncSnapshot<QuerySnapshot> snapshot){

        if(snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if(snapshot.hasError) {
          return const Text("error");
        }
        return Expanded(child:
        GridView.builder(
            itemCount: snapshot.data!.docs.length,
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) =>
                GestureDetector(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(
                    //   builder: (context) => locationdata2(data[index]),),);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(8.0),
                          child: Flexible(child:
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                  snapshot.data!.docs[index]['imagesUrl'][0].toString(),
                                ),
                              ),
                            ),
                          ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(snapshot.data!.docs[index]['Locationname'].toString(),
                            style: const TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                )
        ),
        );

      }

      )
    );
  }
}
