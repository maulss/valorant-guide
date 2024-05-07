import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  void _initializeVideoPlayer() async {
    try {
      _controller =
          VideoPlayerController.asset('assets/images/contoh_video.mp4')
            ..initialize().then((_) {
              setState(() {});
            });
    } catch (e) {
      print('Failed to initialize video player: $e');
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
    return Scaffold(
      backgroundColor: ColorConstant.red,
      body: SafeArea(
        child: Column(
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
                  "Weapons skin Detail",
                  style: FontStyleConstant.bowlbyOneSCTitlePage,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, top: 40),
              child: Center(
                child: Image.asset("assets/images/rgx_vandal.png"),
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
                      width: double.infinity,
                      child: Text(
                        "RGX 11z Pro Vandal",
                        style: FontStyleConstant.bowlbyOneSCTitlePage
                            .copyWith(fontSize: 30),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(10, -50),
                    child: Container(
                      height: 100,
                      width: 400,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(
                          3,
                          (index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });

                                print('Container index: $index');
                              },
                              child: Container(
                                width: 80,
                                height: 80,
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    width: 5,
                                    color: selectedIndex == index
                                        ? ColorConstant.white
                                        : ColorConstant.red.withOpacity(0),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/images/color_vandal.png',
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
              height: 25,
            ),
            Text(
              "Video preview",
              style:
                  FontStyleConstant.bowlbyOneSCTitlePage.copyWith(fontSize: 25),
            ),
            const SizedBox(
              height: 25,
            ),
            Center(
              child: _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : const CircularProgressIndicator(
                      color: Colors.white,
                    ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
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
                  color: ColorConstant.background,
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
          ],
        ),
      ),
    );
  }
}
