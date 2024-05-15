import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valorant_documentation/constant/color_constant.dart';
import 'package:valorant_documentation/constant/font_style_constant.dart';
import 'package:valorant_documentation/model/service/map_service.dart';
import 'package:valorant_documentation/pages/widgets/form_widget.dart';
import 'package:valorant_documentation/pages/widgets/list_container_widget.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  TextEditingController serachController = TextEditingController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<MapService>(context, listen: false).getMaps();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mapsService = Provider.of<MapService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Maps"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            FormWidget(
              onChanged: (value) => mapsService.searchMaps(value),
              prefixIcon: const Icon(Icons.search),
              hintText: "Search",
              controller: serachController,
              prefixIconColor: ColorConstant.red,
            ),
            const SizedBox(
              height: 29.5,
            ),
            mapsService.isLoading
                ? const Padding(
                    padding: EdgeInsets.only(top: 230),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    ),
                  )
                : mapsService.error != null
                    ? Center(
                        child: Text(
                          "${mapsService.error}",
                          style: FontStyleConstant.bowlbyOneSCTitlePage,
                        ),
                      )
                    : mapsService.maps.isEmpty
                        ? Center(
                            child: Text(
                              "Agents Kosong",
                              style: FontStyleConstant.bowlbyOneSCTitlePage,
                            ),
                          )
                        : mapsService.filteredMaps.isNotEmpty
                            ? Expanded(
                                child: ListView.builder(
                                  itemCount: mapsService.filteredMaps.length,
                                  itemBuilder: (context, index) {
                                    final dataMaps =
                                        mapsService.filteredMaps[index];
                                    if (dataMaps["displayName"] !=
                                        "The Range") {
                                      return GestureDetector(
                                        onTap: () {
                                          mapsService.getDetailMaps(index);
                                          Navigator.pushNamed(
                                              context, '/maps_detail');
                                        },
                                        child: ListContainer(
                                          border: Border.all(
                                              color: ColorConstant.white,
                                              width: 2),
                                          child: Stack(
                                            children: [
                                              Positioned.fill(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            "${dataMaps["splash"]}"),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                ),
                                              ),
                                              Transform.translate(
                                                offset: const Offset(30, 30),
                                                child: Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  height: 40,
                                                  width: 200,
                                                  child: Text(
                                                    "${dataMaps["displayName"]}",
                                                    style: FontStyleConstant
                                                        .bowlbyOneSCTitlePage
                                                        .copyWith(fontSize: 30),
                                                  ),
                                                ),
                                              ),
                                              Transform.translate(
                                                offset: const Offset(30, 60),
                                                child: Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  height: 30,
                                                  width: 300,
                                                  child:
                                                      dataMaps["coordinates"] !=
                                                              null
                                                          ? Text(
                                                              "${dataMaps["coordinates"]}",
                                                              style: FontStyleConstant
                                                                  .bowlbyOneSCDescription
                                                                  .copyWith(
                                                                      color: ColorConstant
                                                                          .white),
                                                            )
                                                          : Text(
                                                              "---",
                                                              style: FontStyleConstant
                                                                  .bowlbyOneSCDescription
                                                                  .copyWith(
                                                                      color: ColorConstant
                                                                          .white),
                                                            ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    } else {
                                      return const SizedBox.shrink();
                                    }
                                  },
                                ),
                              )
                            : Center(
                                child: Text(
                                  "Data Not Found",
                                  style: FontStyleConstant.bowlbyOneSCTitlePage
                                      .copyWith(fontSize: 30),
                                ),
                              ),
          ],
        ),
      ),
    );
  }
}
