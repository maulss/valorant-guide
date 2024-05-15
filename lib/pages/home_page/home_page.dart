import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valorant_documentation/pages/profile_page/profile_page.dart';
import 'package:valorant_documentation/widgets/bottom_navigation_widget.dart';
import 'package:valorant_documentation/pages/exolore_page/explore_page.dart';
import 'package:valorant_documentation/pages/gemini_ai_page/gemini_ai_page.dart';
import 'package:valorant_documentation/pages/welcome_page/welcome_page.dart';
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
      ProfilePage(),
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
