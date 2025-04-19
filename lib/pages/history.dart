import 'package:flutter/material.dart';
import 'package:storebase/pages/admin_dashboard.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: const Text(
          'History',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.white
          ),
        ),
        backgroundColor: Color(0xFF0567F1),
        centerTitle: true,
      )
    );
}