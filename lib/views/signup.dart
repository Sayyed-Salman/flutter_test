import 'package:chat_application/services/auth.dart';
import 'package:chat_application/services/database.dart';
import 'package:chat_application/views/apphome.dart';
import 'package:chat_application/widgets/widget.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key, this.toggle}) : super(key: key);
  final Function? toggle;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isLoading = false;

  AuthMethods authMethods = AuthMethods();
  DatabaseMethods databaseMethods = DatabaseMethods();

  final formKey = GlobalKey<FormState>();
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();

  signMeUp() {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      authMethods
          .signUpWithEmailAndPassword(emailTextEditingController.text,
              passwordTextEditingController.text)
          // ignore: avoid_print
          .then((value) => print(value.uid));

      Map<String, String> userInfoMap = {
        "name": userNameTextEditingController.text,
        "email": emailTextEditingController.text,
      };

      databaseMethods.uploadUserInfo(userInfoMap);

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const ChatHome();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70), child: AppBarMain()),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Form(
                      key: formKey,
                      child: Column(children: [
                        TextFormField(
                            validator: (val) {
                              if (val!.isEmpty || val.length < 4) {
                                return "Username must be greater than 4 characters.";
                              } else {
                                return null;
                              }
                            },
                            controller: userNameTextEditingController,
                            style: whiteColor(),
                            decoration: textFieldInputDecoration("Username")),
                        TextFormField(
                            validator: (val) {
                              if (RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(val!)) {
                                return null;
                              } else {
                                return "Enter a valid email address.";
                              }
                            },
                            controller: emailTextEditingController,
                            style: whiteColor(),
                            decoration: textFieldInputDecoration("Email")),
                        TextFormField(
                            obscureText: true,
                            validator: (val) {
                              if (val!.length > 6) {
                                return null;
                              } else {
                                return "Password must be greater than 6 characters.";
                              }
                            },
                            controller: passwordTextEditingController,
                            style: whiteColor(),
                            decoration: textFieldInputDecoration("Password"))
                      ]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: const Text(
                          "Forget Password",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        signMeUp();
                      },
                      child: Container(
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
                          "Sign Up",
                          style: whiteHeavy(),
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
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        "Sign Up with Google",
                        style: blackHeavy(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Have an Account ? ",
                          style: whiteColor(),
                        ),
                        GestureDetector(
                          onTap: () {
                            widget.toggle!();
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: const Text(
                              "Login.",
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
