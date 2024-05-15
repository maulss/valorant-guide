import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valorant_documentation/constant/color_constant.dart';
import 'package:valorant_documentation/constant/font_style_constant.dart';

import 'package:valorant_documentation/provider/explore_provider.dart';
import 'package:valorant_documentation/pages/widgets/form_widget.dart';

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
    final exploreService = Provider.of<ExploreProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Valorant guide"),
      ),
      body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: [
              FormWidget(
                onChanged: (value) => exploreService.runFilter(value),
                prefixIcon: const Icon(Icons.search),
                hintText: "Search",
                controller: searchController,
                prefixIconColor: ColorConstant.red,
              ),
              const SizedBox(
                height: 29.5,
              ),
              Expanded(
                child: exploreService.filteredList.isNotEmpty
                    ? ListView.builder(
                        itemCount: exploreService.filteredList.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            String currentItem =
                                exploreService.filteredList[index];
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
                                      pageMap[exploreService
                                              .filteredList[index]]?['image'] ??
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
                                      exploreService.filteredList[index],
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
