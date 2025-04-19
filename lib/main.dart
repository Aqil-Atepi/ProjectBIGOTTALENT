import 'package:flutter/material.dart';
import 'package:storebase/auth/auth_gate.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://fdfyezphpkpaearyiecg.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZkZnllenBocGtwYWVhcnlpZWNnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDUwMjU3MTUsImV4cCI6MjA2MDYwMTcxNX0.zaMqh8GXbLPBi7_VJuZVw74YjUXc-S5ANxLh9Iwk8h8',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
    );
  }
}