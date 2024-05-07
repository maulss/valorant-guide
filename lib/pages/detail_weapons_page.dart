import 'package:flutter/material.dart';
import 'package:valorant_documentation/constant/color_constant.dart';
import 'package:valorant_documentation/constant/font_style_constant.dart';

class DetailweaponsPage extends StatelessWidget {
  const DetailweaponsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.red,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 4,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: ColorConstant.white,
                      size: 28,
                    ),
                  ),
                  const SizedBox(
                    width: 65,
                  ),
                  Text(
                    "Weapon Details",
                    style: FontStyleConstant.bowlbyOneSCTitlePage,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 40),
                child: Center(
                  child: Image.asset("assets/images/vandal.png"),
                ),
              ),
              Transform.translate(
                offset: const Offset(155, 55),
                child: SizedBox(
                  height: 20,
                  width: 80,
                  child: Text(
                    "\$ 2900",
                    style: FontStyleConstant.bowlbyOneSCTitlePage
                        .copyWith(fontSize: 17, color: ColorConstant.darkRed),
                  ),
                ),
              ),
              Transform.translate(
                offset: const Offset(15, 0),
                child: SizedBox(
                  height: 80,
                  width: 400,
                  child: Text(
                    "Vandal",
                    style: FontStyleConstant.bowlbyOneSCTitlePage
                        .copyWith(fontSize: 50),
                  ),
                ),
              ),
              Container(
                height: 540,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorConstant.background,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Transform.translate(
                        offset: const Offset(0, -250),
                        child: Container(
                          height: 5,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: ColorConstant.red,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 20,
                                width: 80,
                                child: Text(
                                  "Fire rate",
                                  style: FontStyleConstant
                                      .bowlbyOneSCDescription
                                      .copyWith(color: ColorConstant.red),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 20,
                                width: 160,
                                child: Text(
                                  "category weapons",
                                  style: FontStyleConstant
                                      .bowlbyOneSCDescription
                                      .copyWith(color: ColorConstant.red),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 20,
                                width: 90,
                                child: Text(
                                  "magazine",
                                  style: FontStyleConstant
                                      .bowlbyOneSCDescription
                                      .copyWith(color: ColorConstant.red),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  alignment: Alignment.centerLeft,
                                  height: 20,
                                  width: 80,
                                  child: Text(
                                    "13",
                                    style: FontStyleConstant
                                        .bowlbyOneSCDescription,
                                  )),
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 20,
                                width: 160,
                                child: Text("heavy weapons",
                                    style: FontStyleConstant
                                        .bowlbyOneSCDescription),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 20,
                                width: 90,
                                child: Text("50",
                                    style: FontStyleConstant
                                        .bowlbyOneSCDescription),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 20,
                                width: 80,
                                child: Text(
                                  "Reload",
                                  style: FontStyleConstant
                                      .bowlbyOneSCDescription
                                      .copyWith(color: ColorConstant.red),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 20,
                                width: 160,
                                child: Text(
                                  "1st bullet acc",
                                  style: FontStyleConstant
                                      .bowlbyOneSCDescription
                                      .copyWith(color: ColorConstant.red),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 20,
                                width: 90,
                                child: Text(
                                  "run speed",
                                  style: FontStyleConstant
                                      .bowlbyOneSCDescription
                                      .copyWith(color: ColorConstant.red),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  alignment: Alignment.centerLeft,
                                  height: 20,
                                  width: 80,
                                  child: Text(
                                    "2.5 secs",
                                    style: FontStyleConstant
                                        .bowlbyOneSCDescription,
                                  )),
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 20,
                                width: 160,
                                child: Text("0.25",
                                    style: FontStyleConstant
                                        .bowlbyOneSCDescription),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 20,
                                width: 90,
                                child: Text("0.8",
                                    style: FontStyleConstant
                                        .bowlbyOneSCDescription),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            "Damage",
                            style: FontStyleConstant.bowlbyOneSCDescription
                                .copyWith(color: ColorConstant.red),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Container(
                            height: 150,
                            width: double.infinity,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  1, // Ubah ini sesuai jumlah item yang ingin Anda tampilkan
                              itemBuilder: (context, index) {
                                // Bungkus Container dengan Center untuk menempatkan item di tengah-tengah layar
                                return Center(
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 20),
                                    height: 150,
                                    width: 100,
                                    child: Stack(
                                      children: [
                                        Transform.translate(
                                          offset: const Offset(5, -20),
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 20,
                                            width: 60,
                                            child: Text("0 - 30",
                                                style: FontStyleConstant
                                                    .bowlbyOneSCDescription),
                                          ),
                                        ),
                                        Transform.translate(
                                          offset: const Offset(70, 8),
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 20,
                                            width: 40,
                                            child: Text("100",
                                                style: FontStyleConstant
                                                    .bowlbyOneSCDescription),
                                          ),
                                        ),
                                        Transform.translate(
                                          offset: const Offset(70, 65),
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 20,
                                            width: 40,
                                            child: Text("100",
                                                style: FontStyleConstant
                                                    .bowlbyOneSCDescription),
                                          ),
                                        ),
                                        Transform.translate(
                                          offset: const Offset(70, 125),
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 20,
                                            width: 40,
                                            child: Text("100",
                                                style: FontStyleConstant
                                                    .bowlbyOneSCDescription),
                                          ),
                                        ),
                                        Transform.translate(
                                          offset: Offset(-20, 0),
                                          child: Container(
                                            height: 150,
                                            width: 100,
                                            child: Image.asset(
                                              "assets/images/body.png",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            "skins",
                            style: FontStyleConstant.bowlbyOneSCDescription
                                .copyWith(color: ColorConstant.red),
                          ),
                          Container(
                              height: 100,
                              width: double.infinity,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, '/weapons_skin_details');
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(5),
                                    height: 120,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: ColorConstant.red,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color: ColorConstant.white, width: 1),
                                    ),
                                    child: Image.asset(
                                      'assets/images/vandal.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
