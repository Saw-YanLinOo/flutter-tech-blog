import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:techblog/extensions/extensions.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:techblog/presentation/bloc/home/user_bloc.dart';
import 'package:techblog/presentation/bloc/login/login_bloc.dart';
import 'package:techblog/presentation/bloc/login/login_state.dart';

class LoginScree extends StatefulWidget {
  const LoginScree({super.key});

  @override
  State<LoginScree> createState() => _LoginScreeState();
}

class _LoginScreeState extends State<LoginScree> {
  final RoundedLoadingButtonController _loginBtn =
      RoundedLoadingButtonController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.isTablet ? context.width * 0.4 : context.width,
      child: Center(
        child: SizedBox(
          width: context.isTablet ? context.width * 0.3 : context.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Welcome Back   ",
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
                  controller: _emailController,
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
              PasswordTextField(
                controller: _passwordController,
              ),
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
              BlocConsumer<LoginBloc, LoginState>(
                  listener: _mapBlocState,
                  builder: (context, state) {
                    return RoundedLoadingButton(
                      controller: _loginBtn,
                      onPressed: () {
                        if (_emailController.text.isNotEmpty &&
                            _passwordController.text.isNotEmpty) {
                          context.read<LoginBloc>().loginWithEmailPassword(
                              _emailController.text, _passwordController.text);
                        } else {
                          showSnackBar('Enter Correct Email and Password');
                          _loginBtn.reset();
                        }
                      },
                      child: Text(
                        "Login In",
                        style: TextStyle(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          fontSize: 16,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      borderRadius: 4,
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                      width: double.maxFinite,
                    );
                  }),
              // MouseRegion(
              //   cursor: SystemMouseCursors.click,
              //   child: GestureDetector(
              //     onTap: () {},
              //     child: Container(
              //       height: 40,
              //       decoration: BoxDecoration(
              //         color: Theme.of(context).textTheme.bodyMedium?.color,
              //         borderRadius: BorderRadius.circular(4),
              //       ),
              //       width: double.infinity,
              //       child: Center(
              //         child: Text(
              //           "Login In",
              //           style: TextStyle(
              //             color: Theme.of(context).scaffoldBackgroundColor,
              //             fontSize: 16,
              //             letterSpacing: 1,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 42,
              ),
              Center(
                child: Text(
                  "Or Sign in with",
                  style: TextStyle(
                    color: Theme.of(context).disabledColor,
                  ),
                ),
              ),
              SizedBox(
                height: 42,
              ),
              context.isTablet
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        LoginIconView(
                          icon: FontAwesomeIcons.google,
                          title: "Google",
                          onTap: () {},
                        ),
                        LoginIconView(
                          icon: FontAwesomeIcons.facebook,
                          title: "Facebook",
                          onTap: () {},
                        ),
                        LoginIconView(
                          icon: FontAwesomeIcons.apple,
                          title: "Apple ID",
                          onTap: () {},
                        ),
                      ],
                    )
                  : SizedBox(
                      width: double.maxFinite,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LoginIconView(
                            icon: FontAwesomeIcons.google,
                            title: "Google",
                            onTap: () {},
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          LoginIconView(
                            icon: FontAwesomeIcons.facebook,
                            title: "Facebook",
                            onTap: () {},
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          LoginIconView(
                            icon: FontAwesomeIcons.apple,
                            title: "Apple ID",
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
              Expanded(
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(
                          color: Theme.of(context).disabledColor,
                        ),
                      ),
                      Text(
                        "Sign up for free",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _mapBlocState(BuildContext context, LoginState state) {
    if (state is LoginInitialState) {
      _loginBtn.reset();
    } else if (state is LoginSuccessState) {
      context.read<UserBloc>().getUserInfo();

      _loginBtn.success();
      Future.delayed(
        const Duration(milliseconds: 500),
        () => Navigator.pop(context),
      );
    } else if (state is LoginFailState) {
      _loginBtn.reset();
      showSnackBar("${state.e ?? ""}");
    }
  }

  showSnackBar(String text) {
    final snackBar = SnackBar(
      content: Text(text),
      duration: Duration(milliseconds: 1000),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class LoginIconView extends StatelessWidget {
  const LoginIconView({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: context.isTablet ? null : 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: Theme.of(context).iconTheme.color ?? Colors.black,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 18,
              ),
              SizedBox(
                width: 8,
              ),
              Text(title)
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
    required this.controller,
  });

  final TextEditingController controller;
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
        controller: widget.controller,
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
