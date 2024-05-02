import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valorant_documentation/constant/color_constant.dart';
import 'package:valorant_documentation/constant/font_style_constant.dart';

import 'package:valorant_documentation/provider/home_provider.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<String> listImageHomePage = [
    'assets/images/agents.png',
    'assets/images/weapons.png',
    'assets/images/maps.png',
    'assets/images/ranks.png',
    'assets/images/player cards.png',
  ];

  List<String> listPage = [
    '/agents',
    '/weapons',
    '/maps',
    '/ranks',
    '/playerCards'
  ];

  TextEditingController serachController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Valorant Guide"),
      ),
      body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) => homeProvider.runFilter(value),
                style: FontStyleConstant.bowlbyOneSC
                    .copyWith(fontSize: 12, color: ColorConstant.red),
                cursorColor: ColorConstant.red,
                controller: serachController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorConstant.red),
                  ),
                  hintStyle: FontStyleConstant.bowlbyOneSC
                      .copyWith(color: ColorConstant.red, fontSize: 13),
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: ColorConstant.red,
                  filled: true,
                  fillColor: ColorConstant.white,
                  hintText: "Search",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              const SizedBox(
                height: 29.5,
              ),
              Expanded(
                child: homeProvider.filteredList.isNotEmpty
                    ? ListView.builder(
                        itemCount: homeProvider.filteredList.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              listPage[index],
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 29.5),
                            height: 138,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorConstant.red, width: 2),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 183,
                                  height: 139,
                                  child: Text(
                                    homeProvider.filteredList[index],
                                    style: FontStyleConstant.bowlbyOneSC
                                        .copyWith(fontSize: 28),
                                  ),
                                ),
                                SizedBox(
                                  width: 183,
                                  height: 139,
                                  child: Image.asset(
                                    listImageHomePage[index],
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Center(
                        child: Text(
                          "Data Not Found",
                          style: FontStyleConstant.bowlbyOneSC
                              .copyWith(fontSize: 30),
                        ),
                      ),
              ),
            ],
          )),
    );
  }
}
