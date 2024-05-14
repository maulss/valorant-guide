import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valorant_documentation/constant/color_constant.dart';
import 'package:valorant_documentation/constant/font_style_constant.dart';
import 'package:valorant_documentation/service/gun_buddies_service.dart';

class GunBuddiesPage extends StatefulWidget {
  const GunBuddiesPage({super.key});

  @override
  State<GunBuddiesPage> createState() => _GunBuddiesPageState();
}

class _GunBuddiesPageState extends State<GunBuddiesPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<GunBuddiesService>(context, listen: false).getBuddies();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final buddiesService = Provider.of<GunBuddiesService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gunbuddies"),
      ),
      body: buddiesService.isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: ColorConstant.red,
              ),
            )
          : buddiesService.error != null
              ? Center(
                  child: Text(
                    "${buddiesService.error}",
                    style: FontStyleConstant.bowlbyOneSCTitlePage,
                  ),
                )
              : buddiesService.buddies == null
                  ? Center(
                      child: Text(
                        "Data is empty",
                        style: FontStyleConstant.bowlbyOneSCTitlePage,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(
                          top: 20, left: 10, right: 10, bottom: 10),
                      child: GridView.builder(
                        itemCount: buddiesService.buddies!.data!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          final buddiesData =
                              buddiesService.buddies!.data![index];
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorConstant.white, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: const EdgeInsets.all(5),
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 135,
                                  width: double.infinity,
                                  child: Image.network(
                                    "${buddiesData.displayIcon}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 46.5,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: ColorConstant.red,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    buddiesData.displayName.toString(),
                                    style: FontStyleConstant
                                        .bowlbyOneSCDescription
                                        .copyWith(fontSize: 12),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
    );
  }
}
