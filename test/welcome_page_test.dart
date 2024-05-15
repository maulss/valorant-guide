import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:valorant_documentation/pages/widgets/banner_container_widget.dart';

void main() {
  testWidgets("Test banner welcome page", (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: BannerContainer(
            titleBanner: "Agents",
            subtitleBanner: "",
            pathImage: "assets/images/agen.png",
            offset: Offset(0, 0),
          ),
        ),
      ),
    );
    final text = find.text("Agents");
    expect(text, findsOneWidget);
  });
  testWidgets("Test widget BannerContainer welcome page", (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: BannerContainer(
            titleBanner: "Agents",
            subtitleBanner: "",
            pathImage: "assets/images/agen.png",
            offset: Offset(0, 0),
          ),
        ),
      ),
    );

    expect(find.byType(BannerContainer), findsOneWidget);
  });
}
