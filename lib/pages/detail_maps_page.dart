import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valorant_documentation/constant/color_constant.dart';
import 'package:valorant_documentation/constant/font_style_constant.dart';
import 'package:valorant_documentation/service/map_service.dart';

class DetailMapsPage extends StatefulWidget {
  const DetailMapsPage({super.key});

  @override
  State<DetailMapsPage> createState() => _DetailMapsPageState();
}

class _DetailMapsPageState extends State<DetailMapsPage> {
  int? pickedIndex;
  bool changeMap = false;

  @override
  Widget build(BuildContext context) {
    final detailMaps = Provider.of<MapService>(context);
    setState(() {
      pickedIndex = detailMaps.index;
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("Maps Details"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "${detailMaps.mapsDetail["displayName"]}",
                  style: FontStyleConstant.bowlbyOneSCTitlePage
                      .copyWith(color: ColorConstant.red, fontSize: 35),
                ),
                detailMaps.mapsDetail["coordinates"] != null
                    ? Text(
                        "${detailMaps.mapsDetail["coordinates"]}",
                        style: FontStyleConstant.bowlbyOneSCTitlePage,
                      )
                    : Text(
                        "---",
                        style: FontStyleConstant.bowlbyOneSCTitlePage,
                      ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          changeMap == false
              ? mapGalerry()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: detailMaps.mapsDetail["tacticalDescription"] !=
                                null
                            ? Text(
                                "${detailMaps.mapsDetail["tacticalDescription"]}",
                                style: FontStyleConstant.bowlbyOneSCTitlePage,
                              )
                            : Text(
                                "Arcade map",
                                style: FontStyleConstant.bowlbyOneSCTitlePage,
                              )),
                    Center(
                      child: Image.network(
                          "${detailMaps.mapsDetail["displayIcon"]}"),
                    ),
                  ],
                ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  changeMap = !changeMap;
                  print(changeMap);
                });
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: ColorConstant.red,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.map_rounded),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget mapGalerry() {
    final detailMaps = Provider.of<MapService>(context);
    return Container(
      height: 500,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: Colors.yellow.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 20,
                      width: 200,
                      child: Text(
                        "spike plant Zone",
                        style: FontStyleConstant.bowlbyOneSCDescription
                            .copyWith(fontSize: 10),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: ColorConstant.red.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 20,
                      width: 200,
                      child: Text(
                        "attacker side spawn",
                        style: FontStyleConstant.bowlbyOneSCDescription
                            .copyWith(fontSize: 10),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 157, 236, 160)
                            .withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 20,
                      width: 200,
                      child: Text(
                        "defence side spawn",
                        style: FontStyleConstant.bowlbyOneSCDescription
                            .copyWith(fontSize: 10),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 425,
            child: Image.asset(detailMaps.filteredAsset[pickedIndex!]),
          )
        ],
      ),
    );
  }
}
