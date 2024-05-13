import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valorant_documentation/pages/bottom_navigation_page.dart';
import 'package:valorant_documentation/pages/explore_page.dart';
import 'package:valorant_documentation/pages/gemini_ai_page.dart';
import 'package:valorant_documentation/pages/welcome_page.dart';
import 'package:valorant_documentation/provider/bottom_navigator_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavigationProvider =
        Provider.of<BottomNavigatorProvider>(context);
    List<Widget> listPage = [
      WelcomePage(),
      ExplorePage(),
      GeminiAiPage(),
      WelcomePage(),
    ];
    return Scaffold(
      // body: IndexedStack(
      //   index: bottomNavigationProvider.currentIndex,
      //   children: [listPage[bottomNavigationProvider.currentIndex]],
      // ),
      body: listPage[bottomNavigationProvider.currentIndex],
      bottomNavigationBar: const BottomNavigations(),
    );
  }
}
