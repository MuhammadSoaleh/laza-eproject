import 'package:flutter/material.dart';
import 'package:laza/firestore.dart';
import 'package:laza/my_textfeild.dart';

class Contactus extends StatefulWidget {
   Contactus({super.key});

  @override
  State<Contactus> createState() => _ContactusState();
}
final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
class _ContactusState extends State<Contactus> {
  FirestoreServices _firestoreServices=FirestoreServices();
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Contact Us",
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
            
            Image.network("https://images.pexels.com/photos/7974/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=600",
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
Container(
  height: 100, // Adjust the height as needed
  child: MyTextField(
    hintText: "Enter Your Message",
    obscuretext: false,
    textController: messageController, 
  ),
),

                   ElevatedButton.icon(onPressed: (){
                    //add a new data
                    _firestoreServices.addmessage(emailController.text,messageController.text);
//clear textfeild
emailController.clear();
messageController.clear();
//navigate to dashboard
Navigator.pushNamed(context, '/dashboard');
                   }, label: Text("Submit"))
           
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
