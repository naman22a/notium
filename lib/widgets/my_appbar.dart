import 'package:flutter/material.dart';
import 'package:notium/common/colors.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Notium'),
      centerTitle: true,
      foregroundColor: Colors.white,
      backgroundColor: primaryColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
