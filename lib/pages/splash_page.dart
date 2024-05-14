import 'package:flutter/material.dart';
import 'package:valorant_documentation/constant/color_constant.dart';
import 'package:valorant_documentation/constant/font_style_constant.dart';
import 'package:valorant_documentation/utils/shared_pref.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void checkUser() async {
    final data = await SharedPref.getUserModel();
    Future.delayed(const Duration(seconds: 3), () {
      if (data?.username != null) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }

  @override
  void initState() {
    checkUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.background,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/logo.png",
            width: 250,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Valorant",
            style:
                FontStyleConstant.bowlbyOneSCTitlePage.copyWith(fontSize: 30),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Guide",
            style:
                FontStyleConstant.bowlbyOneSCTitlePage.copyWith(fontSize: 30),
          )
        ],
      )),
    );
  }
}
