import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool obscuretext;
  final TextEditingController textController;
  const MyTextField(
      {super.key,
      required this.hintText,
      required this.obscuretext,
      required this.textController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20,0,20,0),
      child: TextField(
        style: TextStyle(
                      color: Colors.black, // Set the font color here
                    ),
          obscureText: obscuretext,
          controller: textController,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0),
                  borderSide: BorderSide(color: Colors.white10
                      )),
                
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              fillColor: Colors.white,
              filled: true,
              
              hintText: hintText,
              hintStyle: TextStyle(color: const Color.fromARGB(88, 8, 8, 8)))),
    );
  }
}


