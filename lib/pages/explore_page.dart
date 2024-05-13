import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valorant_documentation/constant/color_constant.dart';
import 'package:valorant_documentation/constant/font_style_constant.dart';

import 'package:valorant_documentation/service/home_service.dart';

// ignore: must_be_immutable
class ExplorePage extends StatelessWidget {
  ExplorePage({super.key});

  Map<String, Map<String, String>> pageMap = {
    "Agents": {'route': '/agents', 'image': 'assets/images/agents.png'},
    "Weapons": {'route': '/weapons', 'image': 'assets/images/weapons.png'},
    "Maps": {'route': '/maps', 'image': 'assets/images/maps.png'},
    "Ranks": {'route': '/ranks', 'image': 'assets/images/ranks.png'},
    "PLayer\nCards": {
      'route': '/player_cards',
      'image': 'assets/images/player cards.png'
    },
    "Gun\nBuddies": {
      'route': '/gunbuddies',
      'image': 'assets/images/gunbuddies.png'
    },
  };

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeService>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Valorant guide"),
      ),
      body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) => homeProvider.runFilter(value),
                style: FontStyleConstant.bowlbyOneSCDescription
                    .copyWith(fontSize: 12, color: ColorConstant.red),
                cursorColor: ColorConstant.red,
                controller: searchController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorConstant.red),
                  ),
                  hintStyle: FontStyleConstant.bowlbyOneSCDescription
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
                            String currentItem =
                                homeProvider.filteredList[index];
                            String? routeName = pageMap[currentItem]?['route'];
                            if (routeName != null) {
                              Navigator.pushNamed(context, routeName);
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 29.5),
                            height: 138,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorConstant.red, width: 2),
                            ),
                            child: Stack(
                              children: [
                                Transform.translate(
                                  offset: const Offset(200, 0),
                                  child: SizedBox(
                                    width: 180,
                                    height: 138,
                                    child: Image.asset(
                                      pageMap[homeProvider.filteredList[index]]
                                              ?['image'] ??
                                          '',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Transform.translate(
                                  offset: const Offset(10, 0),
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 180,
                                    height: 138,
                                    child: Text(
                                      homeProvider.filteredList[index],
                                      style: FontStyleConstant
                                          .bowlbyOneSCTitlePage
                                          .copyWith(fontSize: 29),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    : Center(
                        child: Text(
                          "Data Not Found",
                          style: FontStyleConstant.bowlbyOneSCTitlePage
                              .copyWith(fontSize: 30),
                        ),
                      ),
              ),
            ],
          )),
    );
  }
}
