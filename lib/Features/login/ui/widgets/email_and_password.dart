import 'package:docdoc/Core/helpers/app_regex.dart';
import 'package:docdoc/Core/theming/colors.dart';
import 'package:docdoc/Core/theming/spacing.dart';
import 'package:docdoc/Core/widgets/app_text_form_field.dart';
import 'package:docdoc/Features/login/logic/cubit/login_cubit.dart';
import 'package:docdoc/Features/login/ui/widgets/password_validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;

  bool haslowercase = false;
  bool hasUppercase = false;
  bool hasSpecialChar = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordcontrollerListener();
    super.initState();
  }

  void setupPasswordcontrollerListener() {
    passwordController.addListener(() {
      setState(() {
        haslowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialChar = AppRegex.hasSpecialChar(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter your email';
              }
            },
            controller: context.read<LoginCubit>().emailController,
          ),
          verticalSpace(18),
          AppTextFormField(
            controller: context.read<LoginCubit>().passwordController,
            hintText: 'Password',
            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () => setState(() {
                isObscureText = !isObscureText;
              }),
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
                color: ColorsManager.mainBlue,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
            },
          ),
          verticalSpace(24),
          PasswordValidations(
            haslowercase: haslowercase,
            hasUppercase: hasUppercase,
            hasSpecialChar: hasSpecialChar,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
