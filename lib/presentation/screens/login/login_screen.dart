import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:techblog/extensions/extensions.dart';

class LoginScree extends StatelessWidget {
  const LoginScree({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.4,
      child: Center(
        child: SizedBox(
          width: context.width * 0.3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
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
                "Email Address",
                style: TextStyle(),
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Password",
                style: TextStyle(),
              ),
              SizedBox(
                height: 8,
              ),
              PasswordTextField(),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(""),
                  Text(
                    "Forget Password?",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 32,
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        "Login In",
                        style: TextStyle(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          fontSize: 16,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          border: OutlineInputBorder(),
          suffixIcon: InkWell(
            onTap: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            child: Icon(
              obscureText ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
              size: 12,
            ),
          ),
        ),
      ),
    );
  }
}
