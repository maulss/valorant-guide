import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valorant_documentation/constant/color_constant.dart';
import 'package:valorant_documentation/constant/font_style_constant.dart';

import 'package:valorant_documentation/service/player_card_service.dart';

class PlayerCardsPage extends StatefulWidget {
  const PlayerCardsPage({super.key});

  @override
  State<PlayerCardsPage> createState() => _PlayerCardsPageState();
}

class _PlayerCardsPageState extends State<PlayerCardsPage> {
  int currentIndex = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PLayerCardService>(context, listen: false).getCardPlayer();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cardService = Provider.of<PLayerCardService>(context);
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
              : cardService.playerCard == null
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
                            SizedBox(
                              height: 270,
                              width: double.infinity,
                              child: Image.network(
                                "${cardService.playerCard!.data![cardService.currentIndex].largeArt}",
                                fit: BoxFit.contain,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: double.infinity,
                              child: Text(
                                "${cardService.playerCard!.data![cardService.currentIndex].displayName}",
                                style: FontStyleConstant.bowlbyOneSCTitlePage,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 440,
                          width: double.infinity,
                          child: GridView.builder(
                              itemCount: cardService.playerCard!.data!.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3),
                              itemBuilder: (context, index) {
                                final cardData =
                                    cardService.playerCard!.data![index];
                                return GestureDetector(
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
                                      "${cardData.smallArt}",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
    );
  }
}
