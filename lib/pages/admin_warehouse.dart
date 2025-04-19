import 'package:flutter/material.dart';
import 'package:storebase/pages/admin_dashboard.dart';

class AdminWarehouse extends StatelessWidget {
  const AdminWarehouse({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: const Text(
          'Warehouse',
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