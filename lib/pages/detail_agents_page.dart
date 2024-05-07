import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valorant_documentation/constant/color_constant.dart';
import 'package:valorant_documentation/constant/font_style_constant.dart';
import 'package:valorant_documentation/service/agent_service.dart';

class DetailAgentsPage extends StatelessWidget {
  const DetailAgentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final detailAgents = Provider.of<AgentsService>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Agent Details"),
        ),
        body: Consumer(
          builder: (context, value, child) => detailAgents.isLoadingDetailAgents
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                )
              : detailAgents.errorDetailAgents != null
                  ? Center(
                      child: Text(
                        "${detailAgents.errorDetailAgents}",
                        style: FontStyleConstant.bowlbyOneSCTitlePage,
                      ),
                    )
                  : detailAgents.agentsDetail.isEmpty
                      ? Center(
                          child: Text(
                            "Data Kosong",
                            style: FontStyleConstant.bowlbyOneSCTitlePage,
                          ),
                        )
                      : SingleChildScrollView(
                          child: Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 350,
                                  width: 350,
                                  child: Image.network(
                                    "${detailAgents.agentsDetail['bustPortrait']}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Name :",
                                            style: FontStyleConstant
                                                .bowlbyOneSCDescription
                                                .copyWith(
                                                    color: ColorConstant.red),
                                          ),
                                          Text(
                                              "${detailAgents.agentsDetail["displayName"]}",
                                              style: FontStyleConstant
                                                  .bowlbyOneSCDescription),
                                        ],
                                      ),
                                      const Divider(
                                        thickness: 2,
                                        color: Colors.white,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Type :",
                                            style: FontStyleConstant
                                                .bowlbyOneSCDescription
                                                .copyWith(
                                                    color: ColorConstant.red),
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                width: 15,
                                                height: 15,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                    "${detailAgents.agentsDetail['role']['displayIcon']}"),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                  "${detailAgents.agentsDetail['role']['displayName']}",
                                                  style: FontStyleConstant
                                                      .bowlbyOneSCDescription)
                                            ],
                                          ),
                                        ],
                                      ),
                                      const Divider(
                                        thickness: 2,
                                        color: Colors.white,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Description : ',
                                              style: FontStyleConstant
                                                  .bowlbyOneSCDescription
                                                  .copyWith(
                                                color: Colors.red,
                                              ),
                                            ),
                                            TextSpan(
                                                text: detailAgents.agentsDetail[
                                                    'description'],
                                                style: FontStyleConstant
                                                    .bowlbyOneSCDescription),
                                          ],
                                        ),
                                      ),
                                      const Divider(
                                        thickness: 2,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Abilities",
                                        style: FontStyleConstant
                                            .bowlbyOneSCDescription
                                            .copyWith(color: ColorConstant.red),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        height: 80,
                                        width: double.infinity,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                showModalBottomSheet(
                                                  context: context,
                                                  builder: (context) {
                                                    return Container(
                                                      height: 480,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                          Radius.circular(25.0),
                                                        ),
                                                        color: ColorConstant
                                                            .background,
                                                      ),
                                                      padding:
                                                          const EdgeInsets.all(
                                                              16.0),
                                                      child: Stack(
                                                        children: [
                                                          Transform.translate(
                                                            offset:
                                                                const Offset(
                                                                    140, -65),
                                                            child: Container(
                                                              height: 100,
                                                              width: 100,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle),
                                                              child:
                                                                  Image.network(
                                                                "${detailAgents.agentsDetail["abilities"][0]['displayIcon']}",
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 50),
                                                            height: 500,
                                                            width: 500,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    "${detailAgents.agentsDetail["abilities"][0]['displayName']}",
                                                                    style: FontStyleConstant
                                                                        .bowlbyOneSCTitlePage
                                                                        .copyWith(
                                                                            fontSize:
                                                                                30,
                                                                            color:
                                                                                ColorConstant.red),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  Text(
                                                                      "${detailAgents.agentsDetail["abilities"][0]['description']}",
                                                                      style: FontStyleConstant
                                                                          .bowlbyOneSCDescription)
                                                                ],
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              child: Container(
                                                height: 80,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color:
                                                          ColorConstant.white,
                                                      width: 2),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Image.network(
                                                  "${detailAgents.agentsDetail["abilities"][0]['displayIcon']}",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                showModalBottomSheet(
                                                  context: context,
                                                  builder: (context) {
                                                    return Container(
                                                      height: 480,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                          Radius.circular(25.0),
                                                        ),
                                                        color: ColorConstant
                                                            .background,
                                                      ),
                                                      padding:
                                                          const EdgeInsets.all(
                                                              16.0),
                                                      child: Stack(
                                                        children: [
                                                          Transform.translate(
                                                            offset:
                                                                const Offset(
                                                                    140, -65),
                                                            child: Container(
                                                              height: 100,
                                                              width: 100,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle),
                                                              child:
                                                                  Image.network(
                                                                "${detailAgents.agentsDetail["abilities"][1]['displayIcon']}",
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 50),
                                                            height: 500,
                                                            width: 500,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    "${detailAgents.agentsDetail["abilities"][1]['displayName']}",
                                                                    style: FontStyleConstant
                                                                        .bowlbyOneSCTitlePage
                                                                        .copyWith(
                                                                            fontSize:
                                                                                30,
                                                                            color:
                                                                                ColorConstant.red),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  Text(
                                                                      "${detailAgents.agentsDetail["abilities"][1]['description']}",
                                                                      style: FontStyleConstant
                                                                          .bowlbyOneSCDescription)
                                                                ],
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              child: Container(
                                                height: 80,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color:
                                                          ColorConstant.white,
                                                      width: 2),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Image.network(
                                                  "${detailAgents.agentsDetail["abilities"][1]['displayIcon']}",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                showModalBottomSheet(
                                                  context: context,
                                                  builder: (context) {
                                                    return Container(
                                                      height: 480,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                          Radius.circular(25.0),
                                                        ),
                                                        color: ColorConstant
                                                            .background,
                                                      ),
                                                      padding:
                                                          const EdgeInsets.all(
                                                              16.0),
                                                      child: Stack(
                                                        children: [
                                                          Transform.translate(
                                                            offset:
                                                                const Offset(
                                                                    140, -65),
                                                            child: Container(
                                                              height: 100,
                                                              width: 100,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle),
                                                              child:
                                                                  Image.network(
                                                                "${detailAgents.agentsDetail["abilities"][2]['displayIcon']}",
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 50),
                                                            height: 500,
                                                            width: 500,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    "${detailAgents.agentsDetail["abilities"][2]['displayName']}",
                                                                    style: FontStyleConstant
                                                                        .bowlbyOneSCTitlePage
                                                                        .copyWith(
                                                                            fontSize:
                                                                                30,
                                                                            color:
                                                                                ColorConstant.red),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  Text(
                                                                      "${detailAgents.agentsDetail["abilities"][2]['description']}",
                                                                      style: FontStyleConstant
                                                                          .bowlbyOneSCDescription)
                                                                ],
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              child: Container(
                                                height: 80,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color:
                                                          ColorConstant.white,
                                                      width: 2),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Image.network(
                                                  "${detailAgents.agentsDetail["abilities"][2]['displayIcon']}",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                showModalBottomSheet(
                                                  context: context,
                                                  builder: (context) {
                                                    return Container(
                                                      height: 480,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                          Radius.circular(25.0),
                                                        ),
                                                        color: ColorConstant
                                                            .background,
                                                      ),
                                                      padding:
                                                          const EdgeInsets.all(
                                                              16.0),
                                                      child: Stack(
                                                        children: [
                                                          Transform.translate(
                                                            offset:
                                                                const Offset(
                                                                    140, -65),
                                                            child: Container(
                                                              height: 100,
                                                              width: 100,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle),
                                                              child:
                                                                  Image.network(
                                                                "${detailAgents.agentsDetail["abilities"][3]['displayIcon']}",
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 50),
                                                            height: 500,
                                                            width: 500,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    "${detailAgents.agentsDetail["abilities"][3]['displayName']}",
                                                                    style: FontStyleConstant
                                                                        .bowlbyOneSCTitlePage
                                                                        .copyWith(
                                                                            fontSize:
                                                                                30,
                                                                            color:
                                                                                ColorConstant.red),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  Text(
                                                                      "${detailAgents.agentsDetail["abilities"][3]['description']}",
                                                                      style: FontStyleConstant
                                                                          .bowlbyOneSCDescription)
                                                                ],
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              child: Container(
                                                height: 80,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color:
                                                          ColorConstant.white,
                                                      width: 2),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Image.network(
                                                  "${detailAgents.agentsDetail["abilities"][3]['displayIcon']}",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
        ));
  }
}
