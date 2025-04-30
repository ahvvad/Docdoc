import 'package:docdoc/Core/helpers/spacing.dart';
import 'package:docdoc/Core/theming/colors.dart';
import 'package:docdoc/Core/theming/styles.dart';
import 'package:docdoc/Features/home/data/models/specializations_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SpecialityListViewItem extends StatelessWidget {
  final SpecializationsData? specializationsData;
  final int itemIndex;
  final int selectedIndex;
  const SpecialityListViewItem({
    super.key,
    this.specializationsData,
    required this.itemIndex,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 24.w),
      child: Column(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: itemIndex == selectedIndex
                ? Container(
                    key: const ValueKey('selected'),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorsManager.mainBlue,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      radius: 27,
                      backgroundColor: ColorsManager.lightBlue,
                      child: SvgPicture.asset(
                        'assets/svgs/active_speciality.svg',
                        height: 38.h,
                        width: 38.w,
                      ),
                    ),
                  )
                : CircleAvatar(
                    key: const ValueKey('unselected'),
                    radius: 28,
                    backgroundColor: ColorsManager.lightBlue,
                    child: SvgPicture.asset(
                      'assets/svgs/inactive_speciality.svg',
                      height: 38.h,
                      width: 38.w,
                    ),
                  ),
          ),
          verticalSpace(8),
          Text(
            specializationsData?.name ?? 'Specialization',
            style: itemIndex == selectedIndex
                ? TextStyles.font12DarkBlueBold
                : TextStyles.font12DarkBlueRegular,
          ),
        ],
      ),
    );
  }
}
