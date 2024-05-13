import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valorant_documentation/constant/color_constant.dart';
import 'package:valorant_documentation/constant/font_style_constant.dart';

import 'package:valorant_documentation/service/card_player_service.dart';

class PlayerCardsPage extends StatefulWidget {
  PlayerCardsPage({super.key});

  @override
  State<PlayerCardsPage> createState() => _PlayerCardsPageState();
}

class _PlayerCardsPageState extends State<PlayerCardsPage> {
  int currentIndex = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CardPlayerService>(context, listen: false).getCardPlayer();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cardService = Provider.of<CardPlayerService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Player cards",
        ),
      ),
      body: cardService.isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: ColorConstant.red,
              ),
            )
          : cardService.error != null
              ? Center(
                  child: Text("${cardService.error}"),
                )
              : cardService.cardPlayer.isEmpty
                  ? Center(
                      child: Text(
                        "Data Is Empty",
                        style: FontStyleConstant.bowlbyOneSCTitlePage,
                      ),
                    )
                  : Column(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 270,
                              width: double.infinity,
                              child: Image.network(
                                "${cardService.cardPlayer[cardService.currentIndex]["largeArt"]}",
                                fit: BoxFit.contain,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: double.infinity,
                              child: Text(
                                "${cardService.cardPlayer[cardService.currentIndex]["displayName"]}",
                                style: FontStyleConstant.bowlbyOneSCTitlePage,
                              ),
                            )
                          ],
                        ),
                        Container(
                          height: 440,
                          width: double.infinity,
                          child: GridView.builder(
                            itemCount: cardService.cardPlayer.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3),
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                cardService.getIndex(index);
                              },
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: cardService.currentIndex == index
                                        ? ColorConstant.red
                                        : ColorConstant.white,
                                    width: cardService.currentIndex == index
                                        ? 3
                                        : 2,
                                  ),
                                ),
                                child: Image.network(
                                  "${cardService.cardPlayer[index]["largeArt"]}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
    );
  }
}
