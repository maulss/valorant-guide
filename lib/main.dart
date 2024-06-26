import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:provider/provider.dart';
import 'package:valorant_documentation/constant/apikey_constant.dart';
import 'package:valorant_documentation/constant/color_constant.dart';
import 'package:valorant_documentation/constant/font_style_constant.dart';
import 'package:valorant_documentation/pages/agents_page/agents_page.dart';
import 'package:valorant_documentation/pages/agents_page/detail_agents_page.dart';
import 'package:valorant_documentation/pages/auth_page/login_page.dart';
import 'package:valorant_documentation/pages/auth_page/signup_page.dart';
import 'package:valorant_documentation/pages/maps_page/detail_maps_page.dart';
import 'package:valorant_documentation/pages/splash_page/splash_page.dart';
import 'package:valorant_documentation/pages/weapons_page/detail_weapons_page.dart';
import 'package:valorant_documentation/pages/weapons_page/detail_weapons_skin_page.dart';
import 'package:valorant_documentation/pages/gemini_ai_page/gemini_ai_page.dart';
import 'package:valorant_documentation/pages/gun_buddies_page/gun_buudies_page.dart';
import 'package:valorant_documentation/pages/exolore_page/explore_page.dart';
import 'package:valorant_documentation/pages/home_page/home_page.dart';
import 'package:valorant_documentation/pages/maps_page/maps_page.dart';
import 'package:valorant_documentation/pages/player_card_page/player_cards_page.dart';
import 'package:valorant_documentation/pages/ranks_page/ranks_page.dart';
import 'package:valorant_documentation/pages/weapons_page/weapons_page.dart';
import 'package:valorant_documentation/pages/welcome_page/welcome_page.dart';
import 'package:valorant_documentation/provider/bottom_navigator_provider.dart';
import 'package:valorant_documentation/provider/form_provider.dart';
import 'package:valorant_documentation/model/service/player_card_service.dart';
import 'package:valorant_documentation/model/service/gemini_service.dart';
import 'package:valorant_documentation/model/service/gun_buddies_service.dart';
import 'package:valorant_documentation/provider/explore_provider.dart';
import 'package:valorant_documentation/model/service/agent_service.dart';
import 'package:valorant_documentation/model/service/map_service.dart';
import 'package:valorant_documentation/model/service/rank_service.dart';
import 'package:valorant_documentation/model/service/weapons_service.dart';

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
          create: (context) => PLayerCardService(),
        ),
        ChangeNotifierProvider(
          create: (context) => ExploreProvider(),
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
          create: (context) => GeminiService(),
        ),
        ChangeNotifierProvider(
          create: (context) => GunBuddiesService(),
        ),
        ChangeNotifierProvider(
          create: (context) => FormProvider(),
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
        initialRoute: '/splash',
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
          '/player_cards': (context) => const PlayerCardsPage(),
          '/gunbuddies': (context) => const GunBuddiesPage(),
          '/gemini_ai': (context) => GeminiAiPage(),
          '/welcome': (context) => WelcomePage(),
          '/home': (context) => const HomePage(),
          '/splash': (context) => const SplashPage(),
          '/login': (context) => LoginPage(),
          '/sign_up': (context) => SignUpPage(),
        },
      ),
    );
  }
}
