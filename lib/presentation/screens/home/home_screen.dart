import 'package:flutter/material.dart';
import 'package:techblog/extensions/extensions.dart';
import 'package:techblog/presentation/screens/home/home_mobile_screen.dart';
import 'package:techblog/presentation/screens/home/home_window_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context.isTablet ? HomeWindowScreen() : HomeMobileScreen(),
    );
  }
}
