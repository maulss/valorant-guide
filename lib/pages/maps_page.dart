import 'package:flutter/material.dart';
import 'package:valorant_documentation/constant/color_constant.dart';
import 'package:valorant_documentation/constant/font_style_constant.dart';
import 'package:valorant_documentation/widgets/list_container_widget.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Maps"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              // onChanged: (value) => homeProvider.runFilter(value),
              style: FontStyleConstant.bowlbyOneSCDescription
                  .copyWith(fontSize: 12, color: ColorConstant.red),
              cursorColor: ColorConstant.red,
              // controller: serachController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorConstant.red),
                ),
                hintStyle: FontStyleConstant.bowlbyOneSCDescription
                    .copyWith(color: ColorConstant.red, fontSize: 13),
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: ColorConstant.red,
                filled: true,
                fillColor: ColorConstant.white,
                hintText: "Search",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            const SizedBox(
              height: 29.5,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/maps_detail'),
                  child: ListContainer(
                    border: Border.all(color: ColorConstant.white, width: 2),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage(
                                    "assets/images/ascent.png",
                                  ),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(30, 30),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            height: 40,
                            width: 200,
                            // color: Colors.amber,
                            child: Text(
                              "ascent",
                              style: FontStyleConstant.bowlbyOneSCTitlePage
                                  .copyWith(fontSize: 30),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(30, 60),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            height: 30,
                            width: 300,
                            // color: Colors.amber,
                            child: Text("45°26'BF'N,12°20'Q'E",
                                style: FontStyleConstant.bowlbyOneSCDescription
                                    .copyWith(color: ColorConstant.darkRed)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
