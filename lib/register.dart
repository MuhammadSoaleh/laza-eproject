import 'package:laza/my_button.dart';
import 'package:laza/my_textfeild.dart';
import 'package:flutter/material.dart';
import 'package:laza/authservice.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController ConfirmpassController = TextEditingController();

  final void Function()? ontap;

  RegisterPage({super.key, required this.ontap});

  void register(BuildContext context) {
    final auth = AuthServices();
    if (passController.text == ConfirmpassController.text) {
      try {
        auth.signupwithemailpassword(emailController.text, passController.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "SIGN IN",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: Colors.black.withOpacity(0.5),
                  offset: Offset(0, 2),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Color(0xff9775FA),
        foregroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              "https://cdn.pixabay.com/photo/2016/11/07/10/14/laptop-1805315_640.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Opacity(opacity: 0.5),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Image.asset(
                  "assets/images/Logo.png",
                  height: 250,
                  width: 300,
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    // Email TextField
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: MyTextField(
                        hintText: "Enter Your Email",
                        obscuretext: false,
                        textController: emailController,
                      ),
                    ),
                    SizedBox(height: 20),
                    // Password TextField
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: MyTextField(
                        hintText: "Enter Your Password",
                        obscuretext: true,
                        textController: passController,
                      ),
                    ),
                    SizedBox(height: 20),
                    // Confirm Password TextField
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: MyTextField(
                        hintText: "Confirm Your Password",
                        obscuretext: true,
                        textController: ConfirmpassController,
                      ),
                    ),
                    SizedBox(height: 20),
                    MyButton(text: "Register", ontap: () => register(context)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already Registered? ",
                          style: TextStyle(color: Colors.black),
                        ),
                        GestureDetector(
                          onTap: ontap,
                          child: Text(
                            " Login Now ",
                            style: TextStyle(
                                color: Color(0xff9775FA),
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
