import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valorant_documentation/constant/color_constant.dart';
import 'package:valorant_documentation/constant/font_style_constant.dart';
import 'package:valorant_documentation/pages/agents_page.dart';
import 'package:valorant_documentation/pages/detail_agents_page.dart';
import 'package:valorant_documentation/pages/home_page.dart';
import 'package:valorant_documentation/pages/maps_page.dart';
import 'package:valorant_documentation/pages/ranks_page.dart';
import 'package:valorant_documentation/pages/weapons_page.dart';
import 'package:valorant_documentation/provider/home_provider.dart';
import 'package:valorant_documentation/service/agent_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AgentsService(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: ColorConstant.background,
          appBarTheme: AppBarTheme(
            titleTextStyle: FontStyleConstant.bowlbyOneSC,
            backgroundColor: ColorConstant.background,
            centerTitle: true,
            iconTheme: IconThemeData(
              size: 28,
              color: ColorConstant.red,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/agents': (context) => const AgentsPage(),
          '/agent_details': (context) => const DetailAgentsPage(),
          '/weapons': (context) => const WeaponsPage(),
          '/maps': (context) => const MapsPage(),
          '/ranks': (context) => const RanksPage(),
        },
      ),
    );
  }
}
