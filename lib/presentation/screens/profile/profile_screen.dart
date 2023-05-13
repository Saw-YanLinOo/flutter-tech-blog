import 'package:flutter/material.dart';
import 'package:techblog/extensions/extensions.dart';
import 'package:techblog/presentation/screens/profile/profile_mobile_screen.dart';
import 'package:techblog/presentation/screens/profile/profile_window_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context.isTablet ? ProfileWindowScreen() : ProfileMobileScreen(),
    );
  }
}
