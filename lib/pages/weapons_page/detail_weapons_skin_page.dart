import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valorant_documentation/model/service/weapons_service.dart';

import 'package:video_player/video_player.dart';
import 'package:valorant_documentation/constant/color_constant.dart';
import 'package:valorant_documentation/constant/font_style_constant.dart';

class DetailweaponsSkinPage extends StatefulWidget {
  const DetailweaponsSkinPage({super.key});

  @override
  _DetailweaponsSkinPageState createState() => _DetailweaponsSkinPageState();
}

class _DetailweaponsSkinPageState extends State<DetailweaponsSkinPage> {
  late VideoPlayerController _controller;
  String? _linkVideo; // Variabel untuk menyimpan link video

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(''));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final weaponsService = Provider.of<WeaponsService>(context, listen: true);

    _linkVideo = weaponsService.getDetailWeaponSkinVideo();

    if (_linkVideo != null && _linkVideo!.isNotEmpty) {
      _controller = VideoPlayerController.networkUrl(Uri.parse(_linkVideo!))
        ..initialize().then((_) {
          setState(() {});
        });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final skinWeapons = Provider.of<WeaponsService>(context);
    int lastIndex = skinWeapons.skinWeapons["levels"].length;
    return Scaffold(
      backgroundColor: ColorConstant.red,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                    width: 35,
                  ),
                  Text(
                    "Weapon skin Details",
                    style: FontStyleConstant.bowlbyOneSCTitlePage,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 40),
                child: Center(
                  child: Image.network(
                      "${skinWeapons.skinWeapons["chromas"][selectedIndex]["fullRender"]}"),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: ColorConstant.white, width: 2),
                  color: ColorConstant.background,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    Transform.translate(
                      offset: const Offset(0, 50),
                      child: Container(
                        alignment: Alignment.center,
                        height: 80,
                        // color: Colors.amber,
                        width: double.infinity,
                        child: Text(
                          "${skinWeapons.skinWeapons["displayName"]}",
                          style: FontStyleConstant.bowlbyOneSCTitlePage
                              .copyWith(fontSize: 23),
                        ),
                      ),
                    ),
                    skinWeapons.skinWeapons["chromas"][selectedIndex]
                                ["swatch"] ==
                            null
                        ? Transform.translate(
                            offset: const Offset(10, -50),
                            child: Container(
                              height: 100,
                              width: 400,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: List.generate(
                                  1,
                                  (index) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedIndex = index;
                                        });
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 80,
                                        height: 80,
                                        margin: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                            width: 5,
                                            color: selectedIndex == index
                                                ? ColorConstant.white
                                                : ColorConstant.red
                                                    .withOpacity(0),
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.image,
                                          size: 70,
                                          color: ColorConstant.white,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          )
                        : Transform.translate(
                            offset: const Offset(10, -50),
                            child: Container(
                              height: 100,
                              width: 400,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: List.generate(
                                  skinWeapons.skinWeapons["chromas"].length,
                                  (index) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedIndex = index;
                                        });
                                      },
                                      child: Container(
                                        width: 80,
                                        height: 80,
                                        margin: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                            width: 5,
                                            color: selectedIndex == index
                                                ? ColorConstant.white
                                                : ColorConstant.red
                                                    .withOpacity(0),
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(
                                            '${skinWeapons.skinWeapons["chromas"][index]["swatch"]}',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Container(
                alignment: Alignment.center,
                height: 80,
                width: 300,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorConstant.white,
                      width: 2,
                    ),
                    color: ColorConstant.background,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Preview Video",
                      style: FontStyleConstant.bowlbyOneSCTitlePage,
                    ),
                    skinWeapons.skinWeapons["levels"][lastIndex - 1]
                                ["streamedVideo"] !=
                            null
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                _controller.value.isPlaying
                                    ? _controller.pause()
                                    : _controller.play();
                              });
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: ColorConstant.red,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                  size: 30,
                                  color: ColorConstant.white,
                                  _controller.value.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow),
                            ),
                          )
                        : Icon(
                            Icons.dangerous,
                            color: ColorConstant.red,
                            size: 30,
                          )
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              skinWeapons.skinWeapons["levels"][lastIndex - 1]
                          ["streamedVideo"] !=
                      null
                  ? _controller.value.isInitialized
                      ? Column(
                          children: [
                            Center(
                              child: Stack(
                                children: [
                                  AspectRatio(
                                    aspectRatio: _controller.value.aspectRatio,
                                    child: VideoPlayer(_controller),
                                  ),
                                  // if (_controller.value.isBuffering)
                                  //   const Center(
                                  //     child: CircularProgressIndicator(
                                  //       color: Colors.white,
                                  //     ),
                                  //   ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            )
                          ],
                        )
                      : const Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 90),
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        )
                  : Container(
                      alignment: Alignment.center,
                      height: 210,
                      decoration: BoxDecoration(
                          color: ColorConstant.background,
                          border: Border.all(
                            color: ColorConstant.white,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30)),
                      width: double.infinity,
                      child: Text(
                        "video not available !!!",
                        style: FontStyleConstant.bowlbyOneSCTitlePage
                            .copyWith(fontSize: 25),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
