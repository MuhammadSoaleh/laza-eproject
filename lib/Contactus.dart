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
  FirestoreServices _firestoreServices = FirestoreServices();

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
          // Background image
          Positioned.fill(
            child: Image.network(
              "https://images.pexels.com/photos/205421/pexels-photo-205421.jpeg?auto=compress&cs=tinysrgb&w=600",
              fit: BoxFit.cover,
            ),
          ),
          // Semi-transparent overlay
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          // Main content
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Image.asset(
                    "assets/images/Logo.png",
                    height: 300,
                    width: 300,
                  ),
                  SizedBox(height: 25),
                  // Email text field
                  MyTextField(
                    hintText: "Enter Your Email",
                    obscuretext: false,
                    textController: emailController,
                  ),
                  SizedBox(height: 25),
                  // Message text field
                  Container(
                    height: 150,
                    width: 450, // Adjust width as needed
                    child: TextField(
                      controller: messageController,
                      obscureText: false,
                      maxLines: 5, // Allows for more lines to be entered
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Enter Your Message Here",
                        hintStyle: TextStyle(color: Color.fromARGB(120, 0, 0, 0)),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Add a new data
                      _firestoreServices.addmessage(
                          emailController.text, messageController.text);
                      // Clear text fields
                      emailController.clear();
                      messageController.clear();
                      // Navigate to dashboard
                      Navigator.pushNamed(context, '/dashboard');
                    },
                    icon: Icon(Icons.send), // Optional: add an icon
                    label: Text("Submit"),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black, backgroundColor: Color(0xff9775FA), // Text color
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
