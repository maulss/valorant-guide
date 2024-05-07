import 'package:flutter/material.dart';
import 'package:valorant_documentation/constant/color_constant.dart';
import 'package:valorant_documentation/constant/font_style_constant.dart';
import 'package:valorant_documentation/widgets/list_container_widget.dart';

class RanksPage extends StatelessWidget {
  const RanksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ranks"),
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
                  onTap: () => Navigator.pushNamed(context, '/ranks_detail'),
                  child: ListContainer(
                    border: Border.all(color: ColorConstant.white, width: 2),
                    child: Stack(
                      children: [
                        Transform.translate(
                          offset: const Offset(10, 75),
                          child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: 200,
                            child: Text(
                              "Radiant",
                              style: FontStyleConstant.bowlbyOneSCTitlePage
                                  .copyWith(fontSize: 35),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(200, 0),
                          child: SizedBox(
                            height: 200,
                            width: 160,
                            child: Image.asset(
                              "assets/images/ranks.png",
                              fit: BoxFit.cover,
                            ),
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
