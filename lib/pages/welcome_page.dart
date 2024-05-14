import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valorant_documentation/constant/color_constant.dart';
import 'package:valorant_documentation/constant/font_style_constant.dart';
import 'package:valorant_documentation/service/agent_service.dart';
import 'package:valorant_documentation/service/map_service.dart';
import 'package:valorant_documentation/service/weapons_service.dart';
import 'package:valorant_documentation/widgets/banner_container_widget.dart';
import 'package:valorant_documentation/widgets/icon_banner_widget.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List<BannerContainer> listCrousel = [
    const BannerContainer(
      height: 190,
      offset: Offset(145, -5),
      titleBanner: "agents",
      subtitleBanner:
          "Understanding the characters and abilities of heroes in the Valorant game",
      pathImage: "assets/images/agen.png",
    ),
    const BannerContainer(
      offset: Offset(200, -25),
      titleBanner: "weapons",
      subtitleBanner:
          "Find a weapon that suits the hero character you are playing",
      pathImage: "assets/images/ulti_jett.png",
    ),
    const BannerContainer(
      height: 175,
      offset: Offset(230, 12),
      titleBanner: "maps",
      subtitleBanner:
          "Analyze hero composition and strategy according to the map",
      pathImage: "assets/maps/Piazza-default.png",
    ),
    const BannerContainer(
      height: 190,
      offset: Offset(210, -2),
      titleBanner: "Ranks",
      subtitleBanner: "Reach the highest rank\nin Valorant",
      pathImage: "assets/images/radiant.png",
    ),
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AgentsService>(context, listen: false).getAgents();
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<WeaponsService>(context, listen: false).getWeapons();
    });
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<MapService>(context, listen: false).getMaps();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final agentsService = Provider.of<AgentsService>(context);
    final weaponService = Provider.of<WeaponsService>(context);
    final mapsService = Provider.of<MapService>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  "Guide\napp For Valorant",
                  style: FontStyleConstant.bowlbyOneSCTitlePage
                      .copyWith(fontSize: 30),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              BannerCarousel(
                customizedBanners: listCrousel,
                height: 220,
                indicatorBottom: false,
                activeColor: ColorConstant.red,
                disableColor: Colors.white,
                animation: true,
                customizedIndicators: const IndicatorModel.animation(
                  width: 20,
                  height: 5,
                  spaceBetween: 2,
                  widthAnimation: 50,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 115,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: ColorConstant.red,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconContainer(
                            onTap: () {
                              Navigator.pushNamed(context, '/ranks');
                            },
                            imagePath: "assets/images/radiant.png",
                            title: "ranks",
                          ),
                          IconContainer(
                            imagePath: "assets/images/display_gunbuddies.png",
                            title: "weapon\nbuddies",
                            onTap: () {
                              Navigator.pushNamed(context, '/gunbuddies');
                            },
                          ),
                          IconContainer(
                            imagePath: "assets/images/cardplayer.png",
                            title: "player\ncards",
                            onTap: () {
                              Navigator.pushNamed(context, '/player_cards');
                            },
                          ),
                          IconContainer(
                            imagePath: "assets/images/ai.png",
                            title: "gameplay\nanalysis",
                            onTap: () {
                              Navigator.pushNamed(context, '/gemini_ai');
                            },
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "agents",
                          style: FontStyleConstant.bowlbyOneSCTitlePage,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/agents');
                          },
                          child: Text(
                            "see all",
                            style: FontStyleConstant.bowlbyOneSCDescription
                                .copyWith(
                              color: ColorConstant.red,
                              fontSize: 10,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    agentsService.isLoadingAgents
                        ? Container(
                            height: 370,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: ColorConstant.red,
                              ),
                            ),
                          )
                        : agentsService.errorAgents != null
                            ? Container(
                                height: 150,
                                child: Center(
                                  child: Text(
                                    "${agentsService.errorAgents}",
                                    style:
                                        FontStyleConstant.bowlbyOneSCTitlePage,
                                  ),
                                ),
                              )
                            : agentsService.agents.isEmpty
                                ? Container(
                                    height: 150,
                                    child: Center(
                                      child: Text(
                                        "Data Agents is empty",
                                        style: FontStyleConstant
                                            .bowlbyOneSCTitlePage,
                                      ),
                                    ),
                                  )
                                : Container(
                                    height: 370,
                                    width: double.infinity,
                                    child: GridView.builder(
                                        itemCount: 10,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2),
                                        itemBuilder: (context, index) {
                                          final dataAgents =
                                              agentsService.agents[index];
                                          return GestureDetector(
                                            onTap: () {
                                              agentsService
                                                  .getDetailAgent(index);
                                              Navigator.pushNamed(
                                                  context, '/agent_details');
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: ColorConstant.white,
                                                  width: 2.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Stack(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                children: [
                                                  Container(
                                                    height: 600,
                                                    child: Image.network(
                                                      "${dataAgents["bustPortrait"]}",
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 55,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: ColorConstant.red,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10,
                                                              right: 10),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "${dataAgents["displayName"]}",
                                                            style: FontStyleConstant
                                                                .bowlbyOneSCDescription
                                                                .copyWith(
                                                                    fontSize:
                                                                        18),
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                "${dataAgents["role"]["displayName"]}",
                                                                style: FontStyleConstant
                                                                    .bowlbyOneSCDescription
                                                                    .copyWith(
                                                                        color: ColorConstant
                                                                            .white,
                                                                        fontSize:
                                                                            14),
                                                              ),
                                                              Image.network(
                                                                "${dataAgents["role"]["displayIcon"]}",
                                                                height: 20,
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Weapons",
                          style: FontStyleConstant.bowlbyOneSCTitlePage,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/weapons');
                          },
                          child: Text(
                            "see all",
                            style: FontStyleConstant.bowlbyOneSCDescription
                                .copyWith(
                              color: ColorConstant.red,
                              fontSize: 10,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    weaponService.isLoading
                        ? Container(
                            height: 150,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: ColorConstant.red,
                              ),
                            ),
                          )
                        : weaponService.errorMessage != null
                            ? Container(
                                height: 150,
                                child: Center(
                                  child: Text(
                                    "${weaponService.errorMessage}",
                                    style:
                                        FontStyleConstant.bowlbyOneSCTitlePage,
                                  ),
                                ),
                              )
                            : weaponService.weapons.isEmpty
                                ? Container(
                                    height: 150,
                                    child: Center(
                                      child: Text(
                                        "Weapons data is empty",
                                        style: FontStyleConstant
                                            .bowlbyOneSCTitlePage,
                                      ),
                                    ),
                                  )
                                : Container(
                                    width: double.infinity,
                                    height: 150,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 6,
                                      itemBuilder: (context, index) {
                                        final dataWeapons =
                                            weaponService.weapons[index];
                                        return GestureDetector(
                                          onTap: () {
                                            weaponService
                                                .getDetailweapon(index);
                                            Navigator.pushNamed(
                                                context, '/weapons_details');
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            margin: const EdgeInsets.all(5),
                                            height: 140,
                                            width: 200,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: ColorConstant.white,
                                                  width: 2.5),
                                            ),
                                            child: Stack(
                                              children: [
                                                Transform.translate(
                                                  offset: const Offset(0, -20),
                                                  child: Image.network(
                                                      '${dataWeapons["displayIcon"]}'),
                                                ),
                                                Transform.translate(
                                                  offset: const Offset(0, 41),
                                                  child: Container(
                                                    height: 55,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: ColorConstant.red,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10,
                                                              right: 10),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "${dataWeapons["displayName"]}",
                                                            style: FontStyleConstant
                                                                .bowlbyOneSCDescription
                                                                .copyWith(
                                                                    fontSize:
                                                                        18),
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                "${dataWeapons["shopData"]["category"]}",
                                                                style: FontStyleConstant
                                                                    .bowlbyOneSCDescription
                                                                    .copyWith(
                                                                        color: ColorConstant
                                                                            .white,
                                                                        fontSize:
                                                                            12),
                                                              ),
                                                              Text(
                                                                "\$ ${dataWeapons["shopData"]["cost"]}",
                                                                style: FontStyleConstant
                                                                    .bowlbyOneSCDescription
                                                                    .copyWith(
                                                                        color: ColorConstant
                                                                            .white,
                                                                        fontSize:
                                                                            14),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Maps",
                          style: FontStyleConstant.bowlbyOneSCTitlePage,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/maps');
                          },
                          child: Text(
                            "see all",
                            style: FontStyleConstant.bowlbyOneSCDescription
                                .copyWith(
                              color: ColorConstant.red,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    mapsService.isLoading
                        ? Container(
                            height: 150,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: ColorConstant.red,
                              ),
                            ),
                          )
                        : mapsService.error != null
                            ? Container(
                                height: 150,
                                child: Center(
                                    child: Text(
                                  "${mapsService.error}",
                                  style: FontStyleConstant.bowlbyOneSCTitlePage,
                                )),
                              )
                            : mapsService.maps.isEmpty
                                ? Container(
                                    height: 150,
                                    child: Center(
                                        child: Text(
                                      "Data is empty",
                                      style: FontStyleConstant
                                          .bowlbyOneSCTitlePage,
                                    )),
                                  )
                                : Container(
                                    width: double.infinity,
                                    height: 150,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 6,
                                      itemBuilder: (context, index) {
                                        final dataMaps =
                                            mapsService.maps[index];
                                        return GestureDetector(
                                          onTap: () {
                                            mapsService.getDetailMaps(index);
                                            Navigator.pushNamed(
                                                context, "/maps_detail");
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.all(5),
                                            height: 140,
                                            width: 200,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    "${dataMaps["splash"]}"),
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: ColorConstant.white,
                                                  width: 2.5),
                                            ),
                                            child: Stack(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20, top: 20),
                                                  child: Text(
                                                    "${dataMaps["displayName"]}",
                                                    style: FontStyleConstant
                                                        .bowlbyOneSCTitlePage,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20, top: 45),
                                                  child: Text(
                                                    "${dataMaps["coordinates"]}",
                                                    style: FontStyleConstant
                                                        .bowlbyOneSCDescription
                                                        .copyWith(fontSize: 10),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
