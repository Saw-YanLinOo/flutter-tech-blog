import 'package:flutter/material.dart';
import 'package:techblog/extensions/extensions.dart';

class LoginScree extends StatelessWidget {
  const LoginScree({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.6,
      width: context.width * 0.4,
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sign In",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Enter your information to start register",
            style: TextStyle(
              fontSize: 13,
              color: Theme.of(context).disabledColor,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Email",
            style: TextStyle(),
          ),
        ],
      ),
    );
  }
}
