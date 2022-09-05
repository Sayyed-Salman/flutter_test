import 'package:chat_application/widgets/widget.dart';
import "package:flutter/material.dart";
import 'package:flutter/widgets.dart';

class SignIn extends StatefulWidget {
  final Function? toggle;
  const SignIn({Key? key, this.toggle}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70), child: AppBarMain()),
      body: Container(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                  style: whiteColor(),
                  decoration: textFieldInputDecoration("Email")),
              TextField(
                  style: whiteColor(),
                  decoration: textFieldInputDecoration("Password")),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: const Text(
                    "Forget Password",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(255, 26, 82, 128),
                    Color.fromARGB(255, 7, 72, 126)
                  ]),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  "Sign In",
                  style: whiteHeavy(),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  "Sign in with Google",
                  style: blackHeavy(),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't Have an Account ? ",
                    style: whiteColor(),
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.toggle!();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text(
                        "Register",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
