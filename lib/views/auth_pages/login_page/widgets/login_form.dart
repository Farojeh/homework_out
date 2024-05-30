import 'dart:convert';

import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/auth_controller.dart';
import 'package:fitnessapp/main.dart';
import 'package:fitnessapp/views/auth_pages/forgot_password/forgot_password.dart';
import 'package:fitnessapp/views/auth_pages/widgets/auth_custom_button.dart';
import 'package:fitnessapp/views/auth_pages/widgets/auth_footer.dart';
import 'package:fitnessapp/views/data_page/data.dart';

import 'package:fitnessapp/widgets/custom_pass_text_field.dart';
import 'package:fitnessapp/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> formKey = GlobalKey();

  final authController = Get.put(AuthController());

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextField(
            enabledBorderColor: Colors.transparent,
            onChanged: (value) {
              authController.email = value;
            },
            isEmail: true,
            textStyle: const TextStyle(color: Colors.white),
            cursorColor: Constans.secondryColor,
            label: 'Email',
            labelStyle:
                TextStyle(color: Constans.subTitleColor.withOpacity(0.5)),
            filled: true,
            fillColor: const Color(0xFF1F1E28),
            focusedBorderColor: Constans.secondryColor,
            suffixIcon: Icons.email_outlined,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomPasswordTextField(
            onChanged: (value) {
              authController.password = value;
              debugPrint('authController.password: ${authController.password}');
            },
            textStyle: const TextStyle(color: Colors.white),
            cursorColor: Constans.secondryColor,
            label: 'Password',
            labelStyle:
                TextStyle(color: Constans.subTitleColor.withOpacity(0.5)),
            filled: true,
            fillColor: const Color(0xFF1F1E28),
            focusedBorderColor: Constans.secondryColor,
            enabledBorderColor: Colors.transparent,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    Get.to(const ForgotPassword());
                  },
                  child: const Text("Forget password ?",
                      style: TextStyle(color: Constans.secondryColor))),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: AuthCustomButton(
              buttonText: 'Login',
              onTap: () async {
                //WorkoutPage()
                if (formKey.currentState!.validate()) {
                  var response = await authController.logIn(
                      authController.email, authController.password, context);
                  if (response.statusCode >= 200 && response.statusCode < 300) {
                    print("kkk");
                    var data = jsonDecode(response.body);
                    var token = data['token'];
                    userInfo?.setString('token', token);
                    print("okkkk");
                    debugPrint('token = ${userInfo?.getString('token')}');
                    print("lllll");
                    Get.offAll(Data());

                  } else {
                    print("iiii");
                  }
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
            ),
          ),
          AuthFooter(
            titleText: 'Don\'t have an account ?',
            specialWord: 'Register',
            onPressed: () {
              Get.offAllNamed('/register');
            },
          ),
        ],
      ),
    );
  }
}
