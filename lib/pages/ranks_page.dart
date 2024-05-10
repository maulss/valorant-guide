import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valorant_documentation/constant/color_constant.dart';
import 'package:valorant_documentation/constant/font_style_constant.dart';
import 'package:valorant_documentation/service/rank_service.dart';

import 'package:valorant_documentation/widgets/rank_widget.dart';

class RanksPage extends StatefulWidget {
  const RanksPage({super.key});

  @override
  State<RanksPage> createState() => _RanksPageState();
}

class _RanksPageState extends State<RanksPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<RankService>(context, listen: false).getRanks();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final rankService = Provider.of<RankService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ranks"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: rankService.isLoading
              ? Padding(
                  padding: const EdgeInsets.only(top: 315),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: ColorConstant.red,
                    ),
                  ),
                )
              : rankService.error != null
                  ? Center(
                      child: Text(
                        "Kesalahan : ${rankService.error}",
                        style: FontStyleConstant.bowlbyOneSCTitlePage,
                      ),
                    )
                  : rankService.ranks.isEmpty
                      ? Center(
                          child: Text(
                            "Rank kosong !!!",
                            style: FontStyleConstant.bowlbyOneSCTitlePage,
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${rankService.ranks[0]["divisionName"]}",
                                  style: FontStyleConstant.bowlbyOneSCTitlePage,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  height: 100,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: ColorConstant.red,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Stack(
                                    children: [
                                      Transform.translate(
                                        offset: Offset(0, 35),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              height: 90,
                                              width: 90,
                                              child: Image.network(
                                                "${rankService.ranks[0]["smallIcon"]}",
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Transform.translate(
                                        offset: Offset(0, 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              height: 30,
                                              width: 110,
                                              child: Text(
                                                "${rankService.ranks[0]["tierName"]}",
                                                style: FontStyleConstant
                                                    .bowlbyOneSCDescription
                                                    .copyWith(fontSize: 13),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            RankWidget(
                              rankTitle: rankService.ranks[3]["divisionName"],
                              tier1: rankService.ranks[3]["smallIcon"],
                              tier2: rankService.ranks[4]["smallIcon"],
                              tier3: rankService.ranks[5]["smallIcon"],
                              tierName1: rankService.ranks[3]["tierName"],
                              tierName2: rankService.ranks[4]["tierName"],
                              tierName3: rankService.ranks[5]["tierName"],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            RankWidget(
                              rankTitle: rankService.ranks[6]["divisionName"],
                              tier1: rankService.ranks[6]["smallIcon"],
                              tier2: rankService.ranks[7]["smallIcon"],
                              tier3: rankService.ranks[8]["smallIcon"],
                              tierName1: rankService.ranks[6]["tierName"],
                              tierName2: rankService.ranks[7]["tierName"],
                              tierName3: rankService.ranks[8]["tierName"],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            RankWidget(
                              rankTitle: rankService.ranks[9]["divisionName"],
                              tier1: rankService.ranks[9]["smallIcon"],
                              tier2: rankService.ranks[10]["smallIcon"],
                              tier3: rankService.ranks[11]["smallIcon"],
                              tierName1: rankService.ranks[9]["tierName"],
                              tierName2: rankService.ranks[10]["tierName"],
                              tierName3: rankService.ranks[11]["tierName"],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            RankWidget(
                              rankTitle: rankService.ranks[12]["divisionName"],
                              tier1: rankService.ranks[12]["smallIcon"],
                              tier2: rankService.ranks[13]["smallIcon"],
                              tier3: rankService.ranks[14]["smallIcon"],
                              tierName1: rankService.ranks[12]["tierName"],
                              tierName2: rankService.ranks[13]["tierName"],
                              tierName3: rankService.ranks[14]["tierName"],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            RankWidget(
                              rankTitle: rankService.ranks[15]["divisionName"],
                              tier1: rankService.ranks[15]["smallIcon"],
                              tier2: rankService.ranks[16]["smallIcon"],
                              tier3: rankService.ranks[17]["smallIcon"],
                              tierName1: rankService.ranks[15]["tierName"],
                              tierName2: rankService.ranks[16]["tierName"],
                              tierName3: rankService.ranks[17]["tierName"],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            RankWidget(
                              rankTitle: rankService.ranks[18]["divisionName"],
                              tier1: rankService.ranks[18]["smallIcon"],
                              tier2: rankService.ranks[19]["smallIcon"],
                              tier3: rankService.ranks[20]["smallIcon"],
                              tierName1: rankService.ranks[18]["tierName"],
                              tierName2: rankService.ranks[19]["tierName"],
                              tierName3: rankService.ranks[20]["tierName"],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            RankWidget(
                              rankTitle: rankService.ranks[21]["divisionName"],
                              tier1: rankService.ranks[21]["smallIcon"],
                              tier2: rankService.ranks[22]["smallIcon"],
                              tier3: rankService.ranks[23]["smallIcon"],
                              tierName1: rankService.ranks[21]["tierName"],
                              tierName2: rankService.ranks[22]["tierName"],
                              tierName3: rankService.ranks[23]["tierName"],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            RankWidget(
                              rankTitle: rankService.ranks[24]["divisionName"],
                              tier1: rankService.ranks[24]["smallIcon"],
                              tier2: rankService.ranks[25]["smallIcon"],
                              tier3: rankService.ranks[26]["smallIcon"],
                              tierName1: rankService.ranks[24]["tierName"],
                              tierName2: rankService.ranks[25]["tierName"],
                              tierName3: rankService.ranks[26]["tierName"],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${rankService.ranks[27]["divisionName"]}",
                                  style: FontStyleConstant.bowlbyOneSCTitlePage,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  height: 100,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: ColorConstant.red,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Stack(
                                    children: [
                                      Transform.translate(
                                        offset: Offset(0, 35),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              height: 90,
                                              width: 90,
                                              child: Image.network(
                                                "${rankService.ranks[27]["smallIcon"]}",
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Transform.translate(
                                        offset: Offset(0, 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              height: 30,
                                              width: 110,
                                              child: Text(
                                                "${rankService.ranks[27]["tierName"]}",
                                                style: FontStyleConstant
                                                    .bowlbyOneSCDescription
                                                    .copyWith(fontSize: 13),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
        ),
      ),
    );
  }
}
