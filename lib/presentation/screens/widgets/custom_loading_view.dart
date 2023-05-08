import 'package:flutter/material.dart';

class CustomLoadingView extends StatelessWidget {
  const CustomLoadingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator.adaptive();
  }
}
