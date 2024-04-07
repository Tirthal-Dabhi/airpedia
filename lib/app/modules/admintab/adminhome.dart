import 'package:airpedia/main.dart';
import 'package:flutter/material.dart';

class adminhome extends StatefulWidget {
  const adminhome({Key? key}) : super(key: key);

  @override
  State<adminhome> createState() => _adminhomeState();
}

class _adminhomeState extends State<adminhome> {
  List<Map> data = [
    {
      'name': 'Diu',
      'image' : 'assets/images/diu1.jpeg',
    },
    {
      'name': 'Kappad',
      'image' : 'assets/images/kappad1.jpeg',
    },
    {
      'name': 'Kovalam',
      'image' : 'assets/images/kovalam1.jpeg',
    },
    {
      'name': 'Lakshdweep',
      'image' : 'assets/images/lakshadweep1.jpeg',
    },
    {
      'name': 'Andaman',
      'image' : 'assets/images/andaman1.jpeg',
    },
    {
      'name': 'Pondicherry',
      'image' : 'assets/images/pondicherry1.jpeg',
    },
    {
      'name': 'Puri',
      'image' : 'assets/images/puri1.jpeg',
    },
    {
      'name': 'Rushikonda',
      'image' : 'assets/images/Rushikonda1.jpg',
    },
    {
      'name': 'Shivrajpur',
      'image' : 'assets/images/shivrajpur1.jpeg',
    },
    {
      'name': 'Tarkarli',
      'image' : 'assets/images/tarkarli1.jpeg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Location Details",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: GridView.builder(
          itemCount: data.length,
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) =>
              GestureDetector(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(
                  //   builder: (context) => Designpage2(data[index]),),);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image:
                            // NetworkImage(
                            //     data[index]['image']
                            // ),
                            AssetImage(data[index]['image'])
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(data[index]["name"],style: TextStyle(fontSize: 27,color: Colors.white),),
                      )
                    ],
                  ),
                ),
              )
      ),
    );
  }
}
