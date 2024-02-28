import 'package:airpedia/app/modules/admintab/tab.dart';
import 'package:airpedia/widgets/buttons/button_primary.dart';
import 'package:airpedia/widgets/cards/card_app.dart';
import 'package:airpedia/widgets/inputs/input_email.dart';
import 'package:airpedia/widgets/inputs/input_password.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../styles/colors.dart';
import '../../../../styles/styles.dart';
import '../controllers/adminlogin_controller.dart';

class AdminloginView extends GetView<AdminloginController> {
  const AdminloginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Obx(() {
        return Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Admin Login Page",
                    style: TextStyles.title,
                  ),
                  verticalSpace(30.w),
                  CardApp(
                    width: double.infinity,
                    radius: Insets.lg,
                    padding: EdgeInsets.all(Insets.lg),
                    isShowShadows: false,
                    shadows: Shadows.universal,
                    child: Column(
                      children: [
                        InputEmail(
                          label: 'emailAddressLabel'.tr,
                          hint: 'emailAddressHint'.tr,
                          controller: controller.cEmail,
                          value: controller.setEmail,
                          validation: (value) => value.isNotEmpty,
                          validationText: 'emailAddressValidationText'.tr,
                        ),
                        InputPassword(
                          controller: controller.cPassword,
                          label: 'passwordLabel'.tr,
                          hint: 'passwordHint'.tr,
                          value: controller.setPassword,
                          validation: (value) => value.isNotEmpty,
                          validationText: 'passwordValidationText'.tr,
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(30.w),
                  ButtonPrimary(
                    label: 'signIn'.tr,
                    //onTap: controller.login,
                    onTap: () async {
                      final data =  await FirebaseFirestore.instance.collection("admin").doc('adminid').get();
                      if(controller.cEmail.value.text.trim()==data['email'] && controller.cPassword.value.text.trim()==data['password'] )
                        {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const admintab()));
                        }
                      else
                        {
                          Widget okButton = TextButton(
                            child: const Text("OK"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          );
                          AlertDialog alert = AlertDialog(
                            title: const Text("Error"),
                            content: const Text("The Email and Password invalid "),
                            actions: [ okButton, ],
                          );
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alert;
                            },
                          );
                        }
                    // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                    // builder: (context) => admintab()), (Route route) => false)
                    },
                    isLoading: controller.isLoading.value,
                    enabled: controller.isValidForm.value,
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}