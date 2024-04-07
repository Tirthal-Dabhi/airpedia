import 'package:airpedia/app/models/app_language_model.dart';
import 'package:airpedia/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:airpedia/styles/colors.dart';
import 'package:airpedia/styles/styles.dart';
import 'package:airpedia/utils/app_asset.dart';
import 'package:airpedia/widgets/buttons/button_primary.dart';
import 'package:airpedia/widgets/inputs/input_dropdown.dart';
import 'package:airpedia/widgets/others/input_dropdwon_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 150.w),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAsset.image('img_background.png')),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'greetingTitle'.tr,
                textAlign: TextAlign.center,
                style: TextStyles.title.copyWith(color: Colors.white),
              ),
              verticalSpace(10.w),
              Text(
                'greetingDesc'.tr,
                textAlign: TextAlign.center,
                style: TextStyles.text.copyWith(color: AppColor.greyColor1),
              ),
              verticalSpace(50.w),
              ButtonPrimary(
                onTap: controller.getStarted,
                label: 'start'.tr,
                width: 220.w,
              ),
            ],
          ),

        ],
      ),
    ));
  }
}
