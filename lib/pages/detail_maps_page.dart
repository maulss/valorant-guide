import 'package:flutter/material.dart';

class DetailMapsPage extends StatelessWidget {
  const DetailMapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Maps Details"),
      ),
      body: Center(child: Image.asset("assets/images/maps_ascent.png")),
    );
  }
}
