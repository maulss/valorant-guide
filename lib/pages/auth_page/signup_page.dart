import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valorant_documentation/constant/color_constant.dart';
import 'package:valorant_documentation/constant/font_style_constant.dart';
import 'package:valorant_documentation/provider/form_provider.dart';
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

  bool obsesure = true;
  // String? _nameError;
  // String? _emailError;
  // String? _passwordError;

  // void _validateName(String value) {
  //   setState(() {
  //     if (value.isEmpty) {
  //       _nameError = 'Name cannot be empty';
  //     } else if (value.length < 3) {
  //       _nameError = 'Name must be at least 3 characters';
  //     } else {
  //       _nameError = null;
  //     }
  //   });
  // }

  // void _validateEmail(String value) {
  //   setState(() {
  //     if (value.isEmpty) {
  //       _emailError = 'Email cannot be empty';
  //     } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
  //       _emailError = 'Enter a valid email';
  //     } else {
  //       _emailError = null;
  //     }
  //   });
  // }

  // void _validatePassword(String value) {
  //   setState(() {
  //     if (value.isEmpty) {
  //       _passwordError = 'Password cannot be empty';
  //     } else if (value.length < 3) {
  //       _passwordError = 'Password must be at least 3 characters';
  //     } else {
  //       _passwordError = null;
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final formProvider = Provider.of<FormProvider>(context);
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
                  onChanged: (value) {
                    formProvider.validateName(value);
                  },
                  controller: nameController,
                  labelText: "name",
                  errorText: formProvider.nameError,
                ),
                const SizedBox(
                  height: 20,
                ),
                FormWidget(
                  onChanged: (value) {
                    formProvider.validateEmail(value);
                  },
                  labelText: "Email",
                  controller: emailController,
                  errorText: formProvider.emailError,
                ),
                const SizedBox(
                  height: 20,
                ),
                FormWidget(
                  onChanged: (value) {
                    formProvider.validatePassword(value);
                  },
                  errorText: formProvider.passwordError,
                  labelText: "password",
                  controller: passController,
                  obscureText: obsesure,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obsesure = !obsesure;
                        print(obsesure);
                      });
                    },
                    icon: Icon(
                        obsesure ? Icons.visibility : Icons.visibility_off),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtomCustomWidget(
                  text: "Signup",
                  onTap: () {
                    if (formProvider.nameError != null ||
                        formProvider.emailError != null ||
                        formProvider.passwordError != null) {
                      const snackBar = SnackBar(
                        content: Text(
                          'Fix the Form',
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
