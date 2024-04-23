import 'package:flutter/material.dart';

class AgentsPage extends StatelessWidget {
  const AgentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: ElevatedButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   child: Image.asset('assets/images/IconKembali.png'),
        // ),
        title: const Text("Agents"),
      ),
    );
  }
}
