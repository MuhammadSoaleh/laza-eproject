import 'package:laza/my_button.dart';
import 'package:laza/my_textfeild.dart';
import 'package:flutter/material.dart';
// import 'package:eproject/authservice.dart';
import 'package:laza/authservice.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  //tap to go on register page
  final void Function()? ontap;

  LoginPage({super.key, required this.ontap});

  void login(BuildContext context) async {
    final AuthService = AuthServices();
    // try login
    try {
      await AuthService.signinwithEmailAndPassword(
          emailController.text, passController.text);
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "LOG IN",
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
            child: 
            // Image.asset(
            //   "assets/fdaf1026bbf9608a68a0fdc8118affee.jpg",
            //   fit: BoxFit.cover,
            // ),
            Image.network("https://images.pexels.com/photos/2528116/pexels-photo-2528116.jpeg?auto=compress&cs=tinysrgb&w=600",
            fit: BoxFit.cover,
            )
          ),
          Opacity(opacity: 0.5),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                Image.asset(
                  "assets//images/Logo.png",
                  height: 300,
                  width: 300,
                ),
                // Text(
                //   "LOG IN",
                //   style: TextStyle(
                //     fontSize: 24,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.white,
                //     shadows: [
                //       Shadow(
                //         blurRadius: 10.0,
                //         color: Colors.black.withOpacity(0.5),
                //         offset: Offset(0, 2),
                //       ),
                //     ],
                //   ),
                // ),
                Column(
                  children: [
                    SizedBox(height: 25, width: 50),
                     //email textfield
          SizedBox(height: 10),
          MyTextField(
            hintText: "Enter Your Email",
            obscuretext: false,
            textController: emailController,
          ),
                    SizedBox(height: 25, width: 50),
                              //pass textfield
          SizedBox(height: 10),
          MyTextField(
            hintText: "Enter Your Password",
            obscuretext: true,
            textController: passController,
          ),
                   MyButton(text: "Login", ontap: () => login(context)),
                    Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Not Registered ? ",
                style: TextStyle(color: Colors.black),
              ),
              GestureDetector(
                onTap: ontap,
                child: Text(
                  " Register Now ",
                  style: TextStyle(
                      color: Color(0xff9775FA), fontWeight: FontWeight.bold),
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
