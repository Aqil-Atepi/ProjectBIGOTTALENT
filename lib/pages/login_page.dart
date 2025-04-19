import 'package:flutter/material.dart';
import 'package:storebase/auth/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final authService = AuthService();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void login() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    try {
      await authService.signInWithEmailPassword(email, password);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0567F1),
      body: ListView(
        children: [
          const SizedBox(height: 150,),

          _loginIcon(),

          const SizedBox(height: 25,),

          _loginPanel(),
        ],
      ),
    );
  }

  Container _loginPanel() {
    return Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          padding: const EdgeInsets.all(20),
          height: 250,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
          ),

          child: Column(
            children: [
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(
                    color: Color(0xFFB6B6B6),
                    fontSize: 14
                  )
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    color: Color(0xFFB6B6B6),
                    fontSize: 14
                  )
                ),
              ),
              SizedBox(height: 15,),
              ElevatedButton(
                onPressed: login, 
                child: const Text('Login')
              )
            ],
          )
        );
  }

  Center _loginIcon() {
    return Center(
      child: Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      )
    );
  }
}