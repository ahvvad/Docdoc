import 'package:docdoc/Core/helpers/spacing.dart';
import 'package:docdoc/Features/home/logic/home_cubit.dart';
import 'package:docdoc/Features/home/logic/home_state.dart';
import 'package:docdoc/Features/home/ui/widgets/doctors_list_view.dart';
import 'package:docdoc/Features/home/ui/widgets/doctors_speciality_list_view.dart';
import 'package:docdoc/Features/home/ui/widgets/home_see_all_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecializationsAndDoctorsBlocBuilder extends StatelessWidget {
  const SpecializationsAndDoctorsBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SpecializationsLoading ||
          current is SpecializationsSuccess ||
          current is SpecializationsError,
      builder: (context, state) {
        return state.maybeWhen(
          specializationsLoading: () => setupLoading(),
          specializationsSuccess: (specializationsResponseModel) {
            var specializationsList =
                specializationsResponseModel.specializationDataList;

            return setupSuccess(specializationsList);
          },
          specializationsError: (errorHandler) => setupError(),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget setupLoading() {
    return const SizedBox(
      height: 100,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget setupSuccess(specializationsList) {
    return Expanded(
      child: Column(
        children: [
          DoctorsSpecialityListView(
            specializationDataList: specializationsList ?? [],
          ),
          const HomeSeeAllHeader(
            title: 'Recommendation Doctor',
          ),
          verticalSpace(18),
          DoctorsListView(
            doctorsList: specializationsList?[0]?.doctorsList,
          ),
        ],
      ),
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
