import 'package:airpedia/app/modules/adminlogin/views/adminlogin_view.dart';
import 'package:airpedia/app/modules/home/components/setting_menu.dart';
import 'package:airpedia/app/modules/login/views/login_view.dart';
import 'package:airpedia/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                          height: 150,
                          width: 150,
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
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                      height: 70,
                      width: 370,
                      child: SettingMenu(icon: Icons.abc_rounded, label: 'About us', onTap: () {},)),
                  SizedBox(
                      height: 70,
                      width: 370,
                      child: SettingMenu(icon: Icons.power_settings_new_rounded, label: 'Sign Out',
                          onTap: () => Get.toNamed(Routes.LOGIN),
                      ))
                ],
              ),
            ),
          ],

        ),
      ),
    );
  }
}
