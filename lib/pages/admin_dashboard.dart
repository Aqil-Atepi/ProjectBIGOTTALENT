import 'package:flutter/material.dart';
import 'package:storebase/auth/auth_service.dart';
import 'package:storebase/pages/admin_warehouse.dart';
import 'package:storebase/pages/statistic.dart';
import 'package:storebase/pages/history.dart';
import 'package:storebase/pages/account.dart';
import 'package:storebase/pages/settings.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AdminDashBoard extends StatefulWidget {
  const AdminDashBoard({super.key});

  @override
  State<AdminDashBoard> createState() => _AdminDashBoardState();
}

class _AdminDashBoardState extends State<AdminDashBoard> {
  final authServive = AuthService();

  int totalStock = 0;

  @override
  void initState() {
    super.initState();
    fetchStockQuantity();
  }

  Future<void> fetchStockQuantity() async {
    final supabase = Supabase.instance.client;

    try {
      final data = await supabase
        .from('stocks')
        .select('quantity');

      int total = 0;
      for (var row in data) {
        total += row['quantity'] as int;
      }
      setState(() {
        totalStock = total;
      });
    } catch (e) {
      print('Error fecthing stock: $e');
    }
  }

  void logout() async {
    await authServive.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: RefreshIndicator(
        onRefresh: fetchStockQuantity,
        child: _dashboardInfo(),
      ),
      drawer: NavDrawer(),
    );
  }

  ListView _dashboardInfo() {
    return ListView(
        padding: const EdgeInsets.all(16),
        children: [
        Text(
            'Stock: $totalStock',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Pull down to refresh',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      );
  }

  AppBar appBar(){
    return AppBar(
      title: Text(
        'DASHBOARD',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white
        ),
      ),
      backgroundColor: Color(0xFF0567F1),
      centerTitle: true,
    );
  }
}

class NavDrawer extends StatelessWidget {
  NavDrawer({Key? key}) : super(key: key);

  final authService = AuthService();

  @override
  Widget build(BuildContext context) => Drawer(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildHeader(context),
          buildMenuItems(context),
        ],
      ),
    )
  );

  Widget buildHeader(BuildContext context) { 
    
    final currentEmail = authService.getCurrentUserEmail();
    String strEmail = currentEmail.toString();

    return Material(
      color: Color(0xFF0567F1),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const Account(),
            )
          );
        },
        child: Container(
          color: Color(0xFF0567F1),
          padding: EdgeInsets.only(
            top: 24 + MediaQuery.of(context).padding.top,
            bottom: 24,
          ),
          child: Column(
            children: [
              CircleAvatar(
                radius: 52,
                backgroundColor: Colors.white,
              ),
              SizedBox(height: 12,),
              Text(
                strEmail,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white
                )
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItems(BuildContext context) => Container(
    padding: const EdgeInsets.all(24),
    child: Wrap(
      runSpacing: 16,
      children: [
        ListTile(
          leading: const Icon(Icons.dashboard),
          title: const Text('Dashboard'),
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const AdminDashBoard(),
              )
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.warehouse),
          title: const Text('Warehouse'),
          onTap: () {
            Navigator.pop(context);

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const AdminWarehouse(),
              )
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.auto_graph),
          title: const Text('Statistic'),
          onTap: () {
            Navigator.pop(context);

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const Statistic(),
              )
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.history),
          title: const Text('History'),
          onTap: () {
            Navigator.pop(context);

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const History(),
              )
            );
          },
        ),
        const Divider(color: Colors.black,),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () {
            Navigator.pop(context);

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const Settings(),
              )
            );
          },
        ),
      ],
    ),
  );
}