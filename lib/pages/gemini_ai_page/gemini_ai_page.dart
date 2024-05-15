import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valorant_documentation/constant/color_constant.dart';
import 'package:valorant_documentation/constant/font_style_constant.dart';
import 'package:valorant_documentation/model/service/gemini_service.dart';

class GeminiAiPage extends StatefulWidget {
  GeminiAiPage({super.key});

  @override
  State<GeminiAiPage> createState() => _GeminiAiPageState();
}

class _GeminiAiPageState extends State<GeminiAiPage> {
  TextEditingController inputController = TextEditingController();

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final geminiService = Provider.of<GeminiService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gameplay analysis"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Stack(
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: ColorConstant.red,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  Transform.translate(
                    offset: const Offset(260, -47),
                    child: Image.asset(
                      'assets/images/jett.png',
                      height: 200,
                    ),
                  ),
                  Column(
                    children: [
                      Transform.translate(
                        offset: const Offset(15, 8),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          height: 50,
                          width: 350,
                          child: Text(
                            "Valorant Gameplay Analysis",
                            style: FontStyleConstant.bowlbyOneSCDescription
                                .copyWith(
                                    fontSize: 16,
                                    color: ColorConstant.cardBackground),
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(-10, 5),
                        child: Container(
                          alignment: Alignment.topLeft,
                          height: 200,
                          width: 300,
                          child: Text(
                            "Discover how to improve\nvalorant gameplay with the\nhelp of AI",
                            style: FontStyleConstant.bowlbyOneSCDescription
                                .copyWith(fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Transform.translate(
                offset: const Offset(0, -70),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 55,
                      width: 300,
                      child: TextFormField(
                        controller: inputController,
                        style: FontStyleConstant.bowlbyOneSCDescription
                            .copyWith(fontSize: 12, color: ColorConstant.red),
                        cursorColor: ColorConstant.red,
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
                          hintText: "Enter the video link",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        geminiService.sendMessage(inputController.text);
                      },
                      child: Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          color: ColorConstant.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          "assets/images/dash.png",
                          fit: BoxFit.cover,
                          color: ColorConstant.red,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Transform.translate(
                offset: const Offset(0, -40),
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ColorConstant.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      textAlign: TextAlign.start,
                      geminiService.generatedGemini ?? "-",
                      style: FontStyleConstant.bowlbyOneSCDescription.copyWith(
                        color: ColorConstant.black,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
