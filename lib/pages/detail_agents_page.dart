import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 350,
                width: 350,
                child: Image.asset(
                  'assets/images/breach.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Name :",
                          style: FontStyleConstant.bowlbyOneSC
                              .copyWith(fontSize: 15),
                        ),
                        Text(
                          "${detailAgents.agentsDetail["displayName"]}",
                          style: FontStyleConstant.bowlbyOneSC
                              .copyWith(fontSize: 15),
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 2,
                      color: Colors.white,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Type :",
                          style: FontStyleConstant.bowlbyOneSC
                              .copyWith(fontSize: 15),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Controller",
                              style: FontStyleConstant.bowlbyOneSC
                                  .copyWith(fontSize: 15),
                            )
                          ],
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 2,
                      color: Colors.white,
                    ),
                    Text(
                      "Description: Brimstone’s orbital arsenal ensures his squad always has the advantage. His ability to deliver utility precisely and safely make him the unmatched boots-on-the-ground commander.",
                      style:
                          FontStyleConstant.bowlbyOneSC.copyWith(fontSize: 15),
                    ),
                    const Divider(
                      thickness: 2,
                      color: Colors.white,
                    ),
                    Text(
                      "Abilities",
                      style:
                          FontStyleConstant.bowlbyOneSC.copyWith(fontSize: 15),
                    ),
                    Container(
                      height: 100,
                      width: double.infinity,
                      color: Colors.amber,
                    ),
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
