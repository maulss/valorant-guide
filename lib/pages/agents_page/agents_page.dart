import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valorant_documentation/constant/color_constant.dart';
import 'package:valorant_documentation/constant/font_style_constant.dart';

import 'package:valorant_documentation/service/agent_service.dart';
import 'package:valorant_documentation/widgets/form_widget.dart';

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

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final agentsService = Provider.of<AgentsService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Agents"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: FormWidget(
                onChanged: (value) => agentsService.searchAgents(value),
                prefixIcon: const Icon(Icons.search),
                hintText: "Search",
                controller: searchController,
                prefixIconColor: ColorConstant.red,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            agentsService.isLoadingAgents
                ? const Padding(
                    padding: EdgeInsets.only(top: 210),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    ),
                  )
                : agentsService.errorAgents != null
                    ? Container(
                        padding: const EdgeInsets.all(20),
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 500,
                        child: Center(
                          child: Text(
                            "${agentsService.errorAgents}",
                            style: FontStyleConstant.bowlbyOneSCTitlePage,
                          ),
                        ),
                      )
                    : agentsService.agents.isEmpty
                        ? Center(
                            child: Text(
                              "Agents Kosong",
                              style: FontStyleConstant.bowlbyOneSCTitlePage,
                            ),
                          )
                        : agentsService.filteredAgents.isNotEmpty
                            ? CarouselSlider.builder(
                                itemCount: agentsService.filteredAgents.length,
                                itemBuilder: (context, index, realIndex) {
                                  final agentsData =
                                      agentsService.filteredAgents[index];
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
                                                            .bowlbyOneSCDescription
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
                                  height: 580,
                                  aspectRatio: 16 / 9,
                                  viewportFraction: 0.8,
                                  initialPage: 0,
                                  enableInfiniteScroll: true,
                                  reverse: false,
                                  enlargeCenterPage: true,
                                  enlargeFactor: 0.3,
                                  scrollDirection: Axis.horizontal,
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
