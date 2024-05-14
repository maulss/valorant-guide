import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valorant_documentation/constant/color_constant.dart';
import 'package:valorant_documentation/constant/font_style_constant.dart';
import 'package:valorant_documentation/service/weapons_service.dart';

class MeleePage extends StatelessWidget {
  const MeleePage({super.key});

  @override
  Widget build(BuildContext context) {
    final detailWeapon = Provider.of<WeaponsService>(context);
    return Scaffold(
      backgroundColor: ColorConstant.red,
      body: SafeArea(
          child: SingleChildScrollView(
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
                  width: 65,
                ),
                Text(
                  "Weapon Details",
                  style: FontStyleConstant.bowlbyOneSCTitlePage,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, top: 40),
              child: Center(
                child: Image.network(
                    "${detailWeapon.weaponsDetail["displayIcon"]}"),
              ),
            ),
            Transform.translate(
              offset: const Offset(15, 10),
              child: SizedBox(
                height: 90,
                width: 400,
                child: Text(
                  "${detailWeapon.weaponsDetail["displayName"]}",
                  style: FontStyleConstant.bowlbyOneSCTitlePage
                      .copyWith(fontSize: 50),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 505,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorConstant.background,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Transform.translate(
                      offset: const Offset(0, -220),
                      child: Container(
                        height: 5,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: ColorConstant.red,
                        ),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(20, 80),
                    child: Text(
                      "Description",
                      style: FontStyleConstant.bowlbyOneSCTitlePage
                          .copyWith(color: ColorConstant.red),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(20, 110),
                    child: Container(
                      height: 200,
                      width: 380,
                      child: Text(
                        "Melee in the game Valorant refers to close combat using melee weapons such as knives. In Valorant, all agents have access to a knife, which can be equipped in the melee weapon slot (slot 3). You can use the knife to attack enemies at close range, and it can deal significant damage if used correctly. Melee attacks can be an effective strategy in certain situations, such as when confronting enemies at close range or when you want to conserve ammunition.",
                        style: FontStyleConstant.bowlbyOneSCDescription,
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(20, 340),
                    child: Text(
                      "skins",
                      style: FontStyleConstant.bowlbyOneSCTitlePage
                          .copyWith(color: ColorConstant.red),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(15, 370),
                    child: Container(
                        height: 100,
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: detailWeapon.weaponsDetail["skins"].length,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              detailWeapon.getDetailWeaponSkin(index);
                              Navigator.pushNamed(
                                  context, '/weapons_skin_details');
                            },
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              height: 120,
                              width: 150,
                              decoration: BoxDecoration(
                                color: ColorConstant.red,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: ColorConstant.white, width: 1),
                              ),
                              child: Image.network(
                                "${detailWeapon.weaponsDetail["skins"][index]["chromas"][0]["fullRender"]}",
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
