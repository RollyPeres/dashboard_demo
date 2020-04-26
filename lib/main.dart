import 'package:flutter/material.dart';

import 'dashboard/dashboard_screen.dart';

void main() {
  runApp(DashboardDemo());
}

class DashboardDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        cardTheme: const CardTheme(
          margin: EdgeInsets.all(20),
        ),
      ),
      home: const DashboardScreen(),
    );
  }
}
