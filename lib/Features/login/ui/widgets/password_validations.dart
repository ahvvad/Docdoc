import 'package:docdoc/Core/theming/colors.dart';
import 'package:docdoc/Core/theming/spacing.dart';
import 'package:docdoc/Core/theming/styles.dart';
import 'package:flutter/material.dart';

class PasswordValidations extends StatelessWidget {
  const PasswordValidations({
    super.key,
    required this.haslowercase,
    required this.hasUppercase,
    required this.hasSpecialChar,
    required this.hasNumber,
    required this.hasMinLength,
  });
  final bool haslowercase;
  final bool hasUppercase;
  final bool hasSpecialChar;
  final bool hasNumber;
  final bool hasMinLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least 1 number', hasNumber),
        verticalSpace(2),
        buildValidationRow('At least 1 lowercase letter', haslowercase),
        verticalSpace(2),
        buildValidationRow('At least 1 uppercase letter', hasUppercase),
        verticalSpace(2),
        buildValidationRow('At least 8 characters long', hasMinLength),
        verticalSpace(2),
        buildValidationRow(
            'At least 1 special character letter', hasSpecialChar),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: ColorsManager.gray,
        ),
        horizontalSpace(6),
        Text(
          text,
          style: TextStyles.font13DarkBlueRegular.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color: hasValidated ? ColorsManager.gray : ColorsManager.darkBlue,
          ),
        )
      ],
    );
  }
}
