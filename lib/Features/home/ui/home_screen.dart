import 'package:docdoc/Core/helpers/spacing.dart';
import 'package:docdoc/Features/home/ui/widgets/doctors_blue_container.dart';
import 'package:docdoc/Features/home/ui/widgets/doctors_speciality_see_all.dart';
import 'package:docdoc/Features/home/ui/widgets/home_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 28.0),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTopBar(),
              const DoctorsBlueContainer(),
              verticalSpace(24.h),
              const DoctorsSpecialitySeeAll(),
            ],
          ),
        ),
      ),
    );
  }
}
