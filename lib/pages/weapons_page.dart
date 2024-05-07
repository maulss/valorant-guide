import 'package:flutter/material.dart';
import 'package:valorant_documentation/constant/color_constant.dart';
import 'package:valorant_documentation/constant/font_style_constant.dart';
import 'package:valorant_documentation/widgets/list_container_widget.dart';

class WeaponsPage extends StatelessWidget {
  const WeaponsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weapons"),
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
                  onTap: () => Navigator.pushNamed(context, '/weapons_details'),
                  child: ListContainer(
                    border: Border.all(color: ColorConstant.white, width: 2),
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, top: 25),
                          height: 140,
                          width: 400,
                          child: Image.asset('assets/images/vandal.png'),
                        ),
                        Transform.translate(
                          offset: const Offset(20, 135),
                          child: Text(
                            'Vandal',
                            style: FontStyleConstant.bowlbyOneSCTitlePage
                                .copyWith(fontSize: 40),
                          ),
                        ),
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
