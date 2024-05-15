import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:valorant_documentation/constant/color_constant.dart';
import 'package:valorant_documentation/constant/font_style_constant.dart';
import 'package:valorant_documentation/provider/form_provider.dart';
import 'package:valorant_documentation/utils/shared_pref.dart';
import 'package:valorant_documentation/widgets/button_custom_widget.dart';
import 'package:valorant_documentation/widgets/form_widget.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  bool obsesure = true;

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
                  "Login",
                  style: FontStyleConstant.bowlbyOneSCTitlePage
                      .copyWith(fontSize: 25),
                ),
                const SizedBox(
                  height: 40,
                ),
                FormWidget(
                  onChanged: (value) {
                    formProvider.validateEmail(value);
                  },
                  errorText: formProvider.emailError,
                  labelText: "Email",
                  controller: emailController,
                ),
                const SizedBox(
                  height: 20,
                ),
                FormWidget(
                  onChanged: (value) {
                    formProvider.validatePassword(value);
                  },
                  errorText: formProvider.passwordError,
                  obscureText: obsesure,
                  labelText: "password",
                  controller: passController,
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
                  text: "Login",
                  onTap: () async {
                    final username = await SharedPref.getUserModel();
                    if (formProvider.emailError != null ||
                        formProvider.passwordError != null) {
                      const snackBar = SnackBar(
                        content: Text(
                          'Fix the form',
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else if (emailController.text != username?.email &&
                        passController.text != username?.password) {
                      const snackBar = SnackBar(
                        content: Text(
                          'Wrong email or password',
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      Navigator.pushReplacementNamed(context, '/home');
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
                      width: 150,
                      child: Text(
                        "don't have an account?",
                        style:
                            FontStyleConstant.bowlbyOneSCDescription.copyWith(
                          fontSize: 10,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/sign_up');
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 20,
                        width: 40,
                        child: Text(
                          "signup",
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
