import 'package:docdoc/Core/theming/styles.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By logging, you agree to our',
            style: TextStyles.font13GrayRegular.copyWith(fontSize: 12.0),
          ),
          TextSpan(
            text: ' Terms & Conditions',
            style: TextStyles.font13DarkBlueMedium.copyWith(fontSize: 12.0),
          ),
          TextSpan(
            text: ' and',
            style: TextStyles.font13GrayRegular.copyWith(
              height: 1.5,
              fontSize: 12.0,
            ),
          ),
          TextSpan(
            text: ' Privacy Policy',
            style: TextStyles.font13DarkBlueMedium.copyWith(fontSize: 12.0),
          ),
        ],
      ),
    );
  }
}
