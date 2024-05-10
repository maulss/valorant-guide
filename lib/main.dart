import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valorant_documentation/constant/color_constant.dart';
import 'package:valorant_documentation/constant/font_style_constant.dart';
import 'package:valorant_documentation/pages/agents_page.dart';
import 'package:valorant_documentation/pages/detail_agents_page.dart';
import 'package:valorant_documentation/pages/detail_maps_page.dart';
import 'package:valorant_documentation/pages/detail_ranks_page.dart';
import 'package:valorant_documentation/pages/detail_weapons_page.dart';
import 'package:valorant_documentation/pages/detail_weapons_skin_page.dart';
import 'package:valorant_documentation/pages/gunbuudies_page.dart';
import 'package:valorant_documentation/pages/home_page.dart';
import 'package:valorant_documentation/pages/maps_page.dart';
import 'package:valorant_documentation/pages/player_cards_page.dart';
import 'package:valorant_documentation/pages/ranks_page.dart';
import 'package:valorant_documentation/pages/weapons_page.dart';
import 'package:valorant_documentation/service/home_service.dart';
import 'package:valorant_documentation/service/agent_service.dart';
import 'package:valorant_documentation/service/map_service.dart';
import 'package:valorant_documentation/service/weapons_service.dart';

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
          create: (context) => HomeService(),
        ),
        ChangeNotifierProvider(
          create: (context) => AgentsService(),
        ),
        ChangeNotifierProvider(
          create: (context) => WeaponsService(),
        ),
        ChangeNotifierProvider(
          create: (context) => MapService(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: ColorConstant.background,
          appBarTheme: AppBarTheme(
            titleTextStyle: FontStyleConstant.bowlbyOneSCTitlePage,
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
          '/weapons_details': (context) => const DetailweaponsPage(),
          '/weapons_skin_details': (context) => const DetailweaponsSkinPage(),
          '/maps': (context) => const MapsPage(),
          '/maps_detail': (context) => DetailMapsPage(),
          '/ranks': (context) => const RanksPage(),
          '/ranks_detail': (context) => const DetailRanksPage(),
          '/player_cards': (context) => const PlayerCardsPage(),
          '/gunbuddies': (context) => const GunBuddiesPage(),
        },
      ),
    );
  }
}
