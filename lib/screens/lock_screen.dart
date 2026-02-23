import 'package:flutter/material.dart';
import 'package:notium/providers/app_lock_provider.dart';
import 'package:notium/screens/home_screen.dart';
import 'package:notium/services/auth_service.dart';
import 'package:provider/provider.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({super.key});

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  Future<void> authInit() async {
    if (!context.read<AppLockProvider>().isAppLocked) {
      Navigator.push(
          context, MaterialPageRoute(builder: (ctx) => HomeScreen()));
      return;
    }

    bool check = await AuthService().authenticate();
    if (check) {
      Navigator.push(
          context, MaterialPageRoute(builder: (ctx) => HomeScreen()));
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      authInit();
    });
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
