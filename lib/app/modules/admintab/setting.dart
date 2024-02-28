import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class asetting extends StatefulWidget {
  const asetting({Key? key}) : super(key: key);

  @override
  State<asetting> createState() => _asettingState();
}

class _asettingState extends State<asetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.deepPurple,
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.white,
                                width: 5.0,
                                style: BorderStyle.none
                            ),
                          ),
                          child: Image.asset("assets/images/img_photo_profile.png"),
                        ),
                        SizedBox(height: 20,),
                        Text("Admin",style: TextStyle(fontSize: 30,color: Colors.white),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],

        ),
      ),
    );
  }
}
