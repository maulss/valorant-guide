import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valorant_documentation/constant/color_constant.dart';
import 'package:valorant_documentation/constant/font_style_constant.dart';
import 'package:valorant_documentation/model/service/weapons_service.dart';

class DetailweaponsPage extends StatelessWidget {
  const DetailweaponsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final detailWeapon = Provider.of<WeaponsService>(context);
    int shotDistance =
        detailWeapon.weaponsDetail["weaponStats"]["damageRanges"].length;
    Offset displayShotStats() {
      if (shotDistance == 1) {
        return const Offset(125, 0);
      } else if (shotDistance == 2) {
        return const Offset(65, 0);
      } else {
        return const Offset(5, 0);
      }
    }

    return Scaffold(
      backgroundColor: ColorConstant.red,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 4,
              ),
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
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 40),
                child: Center(
                  child: Image.network(
                      "${detailWeapon.weaponsDetail['displayIcon']}"),
                ),
              ),
              Transform.translate(
                offset: const Offset(155, 55),
                child: SizedBox(
                  height: 20,
                  width: 80,
                  child: Text(
                    "\$ ${detailWeapon.weaponsDetail["shopData"]["cost"]}",
                    style: FontStyleConstant.bowlbyOneSCTitlePage
                        .copyWith(fontSize: 17, color: ColorConstant.darkRed),
                  ),
                ),
              ),
              Transform.translate(
                offset: const Offset(15, 0),
                child: SizedBox(
                  height: 80,
                  width: 400,
                  child: Text(
                    "${detailWeapon.weaponsDetail["displayName"]}",
                    style: FontStyleConstant.bowlbyOneSCTitlePage
                        .copyWith(fontSize: 50),
                  ),
                ),
              ),
              Container(
                height: 575,
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
                        offset: const Offset(0, -270),
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
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 20,
                                width: 80,
                                child: Text(
                                  "Fire rate",
                                  style: FontStyleConstant
                                      .bowlbyOneSCDescription
                                      .copyWith(color: ColorConstant.red),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 20,
                                width: 160,
                                child: Text(
                                  "category weapons",
                                  style: FontStyleConstant
                                      .bowlbyOneSCDescription
                                      .copyWith(color: ColorConstant.red),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 20,
                                width: 90,
                                child: Text(
                                  "magazine",
                                  style: FontStyleConstant
                                      .bowlbyOneSCDescription
                                      .copyWith(color: ColorConstant.red),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  alignment: Alignment.centerLeft,
                                  height: 20,
                                  width: 80,
                                  child: Text(
                                    "${detailWeapon.weaponsDetail["weaponStats"]["fireRate"]}",
                                    style: FontStyleConstant
                                        .bowlbyOneSCDescription,
                                  )),
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 20,
                                width: 160,
                                child: Text(
                                    "${detailWeapon.weaponsDetail["shopData"]["category"]}",
                                    style: FontStyleConstant
                                        .bowlbyOneSCDescription),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 20,
                                width: 90,
                                child: Text(
                                    "${detailWeapon.weaponsDetail["weaponStats"]["magazineSize"]}",
                                    style: FontStyleConstant
                                        .bowlbyOneSCDescription),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 20,
                                width: 80,
                                child: Text(
                                  "Reload",
                                  style: FontStyleConstant
                                      .bowlbyOneSCDescription
                                      .copyWith(color: ColorConstant.red),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 20,
                                width: 160,
                                child: Text(
                                  "1st bullet acc",
                                  style: FontStyleConstant
                                      .bowlbyOneSCDescription
                                      .copyWith(color: ColorConstant.red),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 20,
                                width: 90,
                                child: Text(
                                  "run speed",
                                  style: FontStyleConstant
                                      .bowlbyOneSCDescription
                                      .copyWith(color: ColorConstant.red),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  alignment: Alignment.centerLeft,
                                  height: 20,
                                  width: 80,
                                  child: Text(
                                    "${detailWeapon.weaponsDetail["weaponStats"]["reloadTimeSeconds"]} secs",
                                    style: FontStyleConstant
                                        .bowlbyOneSCDescription,
                                  )),
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 20,
                                width: 160,
                                child: Text(
                                    "${detailWeapon.weaponsDetail["weaponStats"]["firstBulletAccuracy"]}",
                                    style: FontStyleConstant
                                        .bowlbyOneSCDescription),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 20,
                                width: 90,
                                child: Text(
                                    "${detailWeapon.weaponsDetail["weaponStats"]["runSpeedMultiplier"]}",
                                    style: FontStyleConstant
                                        .bowlbyOneSCDescription),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Damage",
                            style: FontStyleConstant.bowlbyOneSCDescription
                                .copyWith(color: ColorConstant.red),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Container(
                            height: 150,
                            width: double.infinity,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: shotDistance,
                              itemBuilder: (context, index) {
                                return Center(
                                  child: Transform.translate(
                                    offset: displayShotStats(),
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 20),
                                      height: 150,
                                      width: 100,
                                      child: Stack(
                                        children: [
                                          Transform.translate(
                                            offset: const Offset(5, -20),
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: 20,
                                              width: 60,
                                              child: Text(
                                                  "${detailWeapon.weaponsDetail["weaponStats"]["damageRanges"][index]["rangeStartMeters"]} - ${detailWeapon.weaponsDetail["weaponStats"]["damageRanges"][index]["rangeEndMeters"]}",
                                                  style: FontStyleConstant
                                                      .bowlbyOneSCDescription),
                                            ),
                                          ),
                                          Transform.translate(
                                            offset: const Offset(70, 8),
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: 20,
                                              width: 40,
                                              child: Text(
                                                  "${detailWeapon.weaponsDetail["weaponStats"]["damageRanges"][index]["headDamage"]}",
                                                  style: FontStyleConstant
                                                      .bowlbyOneSCDescription),
                                            ),
                                          ),
                                          Transform.translate(
                                            offset: const Offset(70, 65),
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: 20,
                                              width: 40,
                                              child: Text(
                                                  "${detailWeapon.weaponsDetail["weaponStats"]["damageRanges"][index]["bodyDamage"]}",
                                                  style: FontStyleConstant
                                                      .bowlbyOneSCDescription),
                                            ),
                                          ),
                                          Transform.translate(
                                            offset: const Offset(70, 125),
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: 20,
                                              width: 40,
                                              child: Text(
                                                  "${detailWeapon.weaponsDetail["weaponStats"]["damageRanges"][index]["legDamage"]}",
                                                  style: FontStyleConstant
                                                      .bowlbyOneSCDescription),
                                            ),
                                          ),
                                          Transform.translate(
                                            offset: Offset(-20, 0),
                                            child: Container(
                                              height: 150,
                                              width: 100,
                                              child: Image.asset(
                                                "assets/images/body.png",
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            "skins",
                            style: FontStyleConstant.bowlbyOneSCDescription
                                .copyWith(color: ColorConstant.red),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                              height: 100,
                              width: double.infinity,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    detailWeapon.weaponsDetail["skins"].length,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
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
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
