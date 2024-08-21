import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? ontap;
  final String text;
  const MyButton({super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return                     Container(
                      height: 50,
                      width: 105,
                      margin: EdgeInsets.fromLTRB(0, 16, 0, 16),
                      child: ElevatedButton(
                        onPressed: ontap,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Color(0xff9775FA),
                        ),
                        child: Text(text),
                      ),
                    );
  }
}












   
