import 'package:flutter/material.dart';
import 'package:valorant_documentation/constant/color_constant.dart';
import 'package:valorant_documentation/constant/font_style_constant.dart';
import 'package:valorant_documentation/utils/shared_pref.dart';
import 'package:valorant_documentation/widgets/button_custom_widget.dart';
import 'package:valorant_documentation/widgets/form_widget.dart';

// ignore: must_be_immutable
class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/riot.png",
                  height: 40,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Sign up",
                  style: FontStyleConstant.bowlbyOneSCTitlePage
                      .copyWith(fontSize: 25),
                ),
                const SizedBox(
                  height: 40,
                ),
                FormWidget(
                  controller: nameController,
                  labelText: "name",
                ),
                const SizedBox(
                  height: 20,
                ),
                FormWidget(
                  labelText: "Email",
                  controller: emailController,
                ),
                const SizedBox(
                  height: 20,
                ),
                FormWidget(
                  labelText: "password",
                  controller: passController,
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtomCustomWidget(
                  text: "Signup",
                  onTap: () {
                    if (nameController.text.isEmpty ||
                        emailController.text.isEmpty ||
                        passController.text.isEmpty) {
                      const snackBar = SnackBar(
                        content: Text(
                          'Form cannot empty',
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      SharedPref.saveUserModel(
                          username: nameController.text,
                          password: passController.text,
                          email: emailController.text);
                      const snackBar = SnackBar(
                        content: Text(
                          'Sign Up success',
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.restorablePushReplacementNamed(
                          context, '/login');
                    }
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 20,
                      width: 160,
                      child: Text(
                        "already have an account?",
                        style:
                            FontStyleConstant.bowlbyOneSCDescription.copyWith(
                          fontSize: 10,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 20,
                        width: 35,
                        child: Text(
                          "login",
                          style:
                              FontStyleConstant.bowlbyOneSCDescription.copyWith(
                            fontSize: 10,
                            color: ColorConstant.red,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
