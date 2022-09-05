import 'package:flutter/material.dart';

class AppBarMain extends StatelessWidget implements PreferredSizeWidget {
  const AppBarMain({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      title: const Text("Fire Chat"),
      elevation: 0,
      centerTitle: false,
    );
  }
}

InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.white38),
      focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white)),
      enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white)));
}

TextStyle whiteColor() {
  return const TextStyle(
    color: Colors.white,
    fontSize: 17,
  );
}

TextStyle whiteHeavy() {
  return const TextStyle(
    color: Colors.white,
    fontSize: 20,
  );
}

TextStyle blackHeavy() {
  return const TextStyle(
    color: Colors.black,
    fontSize: 20,
  );
}
