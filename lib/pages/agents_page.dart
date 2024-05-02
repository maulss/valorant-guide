import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valorant_documentation/constant/color_constant.dart';
import 'package:valorant_documentation/constant/font_style_constant.dart';

import 'package:valorant_documentation/service/agent_service.dart';

class AgentsPage extends StatefulWidget {
  const AgentsPage({super.key});

  @override
  State<AgentsPage> createState() => _AgentsPageState();
}

class _AgentsPageState extends State<AgentsPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AgentsService>(context, listen: false).getAgents();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final agentsService = Provider.of<AgentsService>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                agentsService.getDetailAgent(3);
              },
              child: Text('Test'))
        ],
        title: const Text("Agents"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
              child: TextFormField(
                // onChanged: (value) => homeProvider.runFilter(value),
                style: FontStyleConstant.bowlbyOneSC
                    .copyWith(fontSize: 12, color: ColorConstant.red),
                cursorColor: ColorConstant.red,
                // controller: serachController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorConstant.red),
                  ),
                  hintStyle: FontStyleConstant.bowlbyOneSC
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
            ),
            const SizedBox(
              height: 50,
            ),
            agentsService.isLoadingAgents
                ? const Padding(
                    padding: EdgeInsets.only(top: 230),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    ),
                  )
                : agentsService.errorAgents != null
                    ? Center(
                        child: Text(
                          "${agentsService.errorAgents}",
                          style: FontStyleConstant.bowlbyOneSC,
                        ),
                      )
                    : agentsService.agents.isEmpty
                        ? Center(
                            child: Text(
                              "Agents Kosong",
                              style: FontStyleConstant.bowlbyOneSC,
                            ),
                          )
                        : Consumer<AgentsService>(
                            builder: (context, value, child) {
                              return CarouselSlider.builder(
                                itemCount: agentsService.agents.length,
                                itemBuilder: (context, index, realIndex) {
                                  final agentsData =
                                      agentsService.agents[index];
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return GestureDetector(
                                        onTap: () {
                                          agentsService.getDetailAgent(index);
                                          Navigator.pushNamed(
                                            context,
                                            '/agent_details',
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Stack(
                                            children: [
                                              Positioned.fill(
                                                top: 50,
                                                bottom: 50,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: ColorConstant.red,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                ),
                                              ),
                                              Positioned.fill(
                                                child: Transform.translate(
                                                  offset:
                                                      const Offset(-25, -45),
                                                  child: Image.network(
                                                    '${agentsData["bustPortrait"]}',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Positioned.fill(
                                                child: Transform.translate(
                                                  offset:
                                                      const Offset(120, -10),
                                                  child: Center(
                                                    child: Transform.rotate(
                                                      angle:
                                                          -90 * 3.14159 / 180,
                                                      child: Text(
                                                        agentsData[
                                                            'displayName'],
                                                        style: FontStyleConstant
                                                            .bowlbyOneSC
                                                            .copyWith(
                                                          fontSize: 50,
                                                          letterSpacing: 3,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                options: CarouselOptions(
                                  height: 550,
                                  aspectRatio: 16 / 9,
                                  viewportFraction: 0.8,
                                  initialPage: 0,
                                  enableInfiniteScroll: true,
                                  reverse: false,
                                  enlargeCenterPage: true,
                                  enlargeFactor: 0.3,
                                  scrollDirection: Axis.horizontal,
                                ),
                              );
                            },
                          ),
          ],
        ),
      ),
    );
  }
}