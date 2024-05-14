import 'package:flutter/material.dart';
import 'package:valorant_documentation/constant/color_constant.dart';
import 'package:valorant_documentation/constant/font_style_constant.dart';
import 'package:valorant_documentation/utils/shared_pref.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? username;
  void getUserName() async {
    final data = await SharedPref.getUserModel();
    username = data?.username;
    setState(() {});
  }

  @override
  void initState() {
    getUserName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hello, $username",
              style: FontStyleConstant.bowlbyOneSCTitlePage,
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: ColorConstant.red,
                      title: Text(
                        'Are you sure you want to log out?',
                        style: FontStyleConstant.bowlbyOneSCTitlePage,
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Cancel',
                            style: FontStyleConstant.bowlbyOneSCDescription,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            SharedPref.deleteKeyToken();
                            Navigator.pushReplacementNamed(context, '/login');
                          },
                          child: Text(
                            'Yes',
                            style: FontStyleConstant.bowlbyOneSCDescription,
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(Icons.logout),
              color: ColorConstant.white,
            )
          ],
        ),
      ),
    );
  }
}
