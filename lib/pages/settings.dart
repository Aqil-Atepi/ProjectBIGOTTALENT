import 'package:flutter/material.dart';
import 'package:storebase/pages/admin_dashboard.dart';

class Settings extends StatelessWidget {
  const Settings ({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: const Text(
          'Settings',
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