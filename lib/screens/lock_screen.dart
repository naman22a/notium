import 'package:flutter/material.dart';
import 'package:notium/screens/home_screen.dart';
import 'package:notium/services/auth_service.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({super.key});

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  Future<void> authInit() async {
    bool check = await AuthService().authenticate();
    if (check) {
      Navigator.push(
          context, MaterialPageRoute(builder: (ctx) => HomeScreen()));
    }
  }

  @override
  void initState() {
    super.initState();
    authInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.deepPurple),
            foregroundColor: WidgetStatePropertyAll(Colors.white),
            padding: WidgetStatePropertyAll(
                EdgeInsetsGeometry.symmetric(horizontal: 30.0, vertical: 10.0)),
          ),
          onPressed: () {
            authInit();
          },
          child: Text('Unlock Notium'),
        ),
      ),
    );
  }
}
