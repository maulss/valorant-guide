import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:provider/provider.dart';
import 'package:valorant_documentation/constant/apikey_constant.dart';
import 'package:valorant_documentation/constant/color_constant.dart';
import 'package:valorant_documentation/constant/font_style_constant.dart';
import 'package:valorant_documentation/pages/agents_page.dart';
import 'package:valorant_documentation/pages/detail_agents_page.dart';
import 'package:valorant_documentation/pages/detail_maps_page.dart';
import 'package:valorant_documentation/pages/detail_ranks_page.dart';
import 'package:valorant_documentation/pages/detail_weapons_page.dart';
import 'package:valorant_documentation/pages/detail_weapons_skin_page.dart';
import 'package:valorant_documentation/pages/gemini_ai_page.dart';
import 'package:valorant_documentation/pages/gunbuudies_page.dart';
import 'package:valorant_documentation/pages/explore_page.dart';
import 'package:valorant_documentation/pages/home_page.dart';
import 'package:valorant_documentation/pages/maps_page.dart';
import 'package:valorant_documentation/pages/player_cards_page.dart';
import 'package:valorant_documentation/pages/ranks_page.dart';
import 'package:valorant_documentation/pages/weapons_page.dart';
import 'package:valorant_documentation/pages/welcome_page.dart';
import 'package:valorant_documentation/provider/bottom_navigator_provider.dart';
import 'package:valorant_documentation/service/player_card_service.dart';
import 'package:valorant_documentation/service/gemini_service.dart';
import 'package:valorant_documentation/service/gun_buddies_service.dart';

import 'package:valorant_documentation/service/home_service.dart';
import 'package:valorant_documentation/service/agent_service.dart';
import 'package:valorant_documentation/service/map_service.dart';
import 'package:valorant_documentation/service/rank_service.dart';
import 'package:valorant_documentation/service/weapons_service.dart';

void main() {
  Gemini.init(apiKey: geiminiKey);
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
        ChangeNotifierProvider(
          create: (context) => RankService(),
        ),
        ChangeNotifierProvider(
          create: (context) => BottomNavigatorProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PLayerCardService(),
        ),
        ChangeNotifierProvider(
          create: (context) => GeminiService(),
        ),
        ChangeNotifierProvider(
          create: (context) => GunBuddiesService(),
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
        initialRoute: '/home',
        routes: {
          '/explore': (context) => ExplorePage(),
          '/agents': (context) => const AgentsPage(),
          '/agent_details': (context) => const DetailAgentsPage(),
          '/weapons': (context) => const WeaponsPage(),
          '/weapons_details': (context) => const DetailweaponsPage(),
          '/weapons_skin_details': (context) => const DetailweaponsSkinPage(),
          '/maps': (context) => const MapsPage(),
          '/maps_detail': (context) => const DetailMapsPage(),
          '/ranks': (context) => const RanksPage(),
          '/ranks_detail': (context) => const DetailRanksPage(),
          '/player_cards': (context) => const PlayerCardsPage(),
          '/gunbuddies': (context) => const GunBuddiesPage(),
          '/gemini_ai': (context) => GeminiAiPage(),
          '/welcome': (context) => WelcomePage(),
          '/home': (context) => const HomePage(),
        },
      ),
    );
  }
}
