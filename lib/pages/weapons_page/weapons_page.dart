import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valorant_documentation/constant/color_constant.dart';
import 'package:valorant_documentation/constant/font_style_constant.dart';
import 'package:valorant_documentation/pages/weapons_page/meele_page.dart';
import 'package:valorant_documentation/service/weapons_service.dart';
import 'package:valorant_documentation/widgets/form_widget.dart';
import 'package:valorant_documentation/widgets/list_container_widget.dart';

class WeaponsPage extends StatefulWidget {
  const WeaponsPage({super.key});

  @override
  State<WeaponsPage> createState() => _WeaponsPageState();
}

class _WeaponsPageState extends State<WeaponsPage> {
  TextEditingController serachController = TextEditingController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<WeaponsService>(context, listen: false).getWeapons();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final weaponsService = Provider.of<WeaponsService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weapons"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            FormWidget(
              onChanged: (value) => weaponsService.searchWeapons(value),
              prefixIcon: const Icon(Icons.search),
              hintText: "Search",
              controller: serachController,
              prefixIconColor: ColorConstant.red,
            ),
            const SizedBox(
              height: 29.5,
            ),
            weaponsService.isLoading
                ? const Padding(
                    padding: EdgeInsets.only(top: 230),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    ),
                  )
                : weaponsService.errorMessage != null
                    ? Center(
                        child: Text(
                          "kesalahan : ${weaponsService.errorMessage}",
                          style: FontStyleConstant.bowlbyOneSCTitlePage,
                        ),
                      )
                    : weaponsService.weapons.isEmpty
                        ? Center(
                            child: Text(
                              "Weapons Kosong",
                              style: FontStyleConstant.bowlbyOneSCTitlePage,
                            ),
                          )
                        : weaponsService.filteredWeapons.isNotEmpty
                            ? Expanded(
                                child: ListView.builder(
                                  itemCount:
                                      weaponsService.filteredWeapons.length,
                                  itemBuilder: (context, index) {
                                    final weaponsData =
                                        weaponsService.filteredWeapons[index];
                                    return GestureDetector(
                                      onTap: () {
                                        weaponsService.getDetailweapon(index);
                                        if (weaponsService
                                                    .filteredWeapons[index]
                                                ["displayName"] !=
                                            "Melee") {
                                          Navigator.pushNamed(
                                              context, '/weapons_details');
                                        } else {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    MeleePage(),
                                              ));
                                        }
                                      },
                                      child: ListContainer(
                                        border: Border.all(
                                            color: ColorConstant.white,
                                            width: 2),
                                        child: Stack(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  left: 25, right: 25, top: 25),
                                              height: 140,
                                              width: 400,
                                              child: Image.network(
                                                  "${weaponsData["displayIcon"]}"),
                                            ),
                                            Transform.translate(
                                              offset: const Offset(20, 135),
                                              child: Text(
                                                '${weaponsData["displayName"]}',
                                                style: FontStyleConstant
                                                    .bowlbyOneSCTitlePage
                                                    .copyWith(fontSize: 40),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
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
