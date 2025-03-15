import 'package:docdoc/Core/theming/styles.dart';
import 'package:docdoc/Features/onboarding/widgets/doc_log_and_name.dart';
import 'package:docdoc/Features/onboarding/widgets/doctor_image_and_text.dart';
import 'package:docdoc/Features/onboarding/widgets/get_started_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
          child: Column(
            children: [
              const DocLogoAndName(),
              SizedBox(height: 30.h),
              const DoctorImageAndText(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: Column(
                  children: [
                    Text(
                      'Manage and schedule all of your medical appointments easily\nwith Docdoc to get a new experience.',
                      textAlign: TextAlign.center,
                      style: TextStyles.font13GrayRegular,
                    ),
                    SizedBox(height: 30.h),
                    const GetStartedButton()
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
