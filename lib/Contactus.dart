import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:laza/firestore.dart';
import 'package:laza/my_textfeild.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class Contactus extends StatefulWidget {
  Contactus({super.key});

  @override
  State<Contactus> createState() => _ContactusState();
}

final TextEditingController emailController = TextEditingController();
final TextEditingController messageController = TextEditingController();

class _ContactusState extends State<Contactus> {
  int _selectedIndex = 0;
  bool _pop = false;
  FirestoreServices _firestoreServices = FirestoreServices();

  void _onNavigationTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (_selectedIndex) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/wishlist');
        break;
      case 2:
        Navigator.pushNamed(context, '/cart');
        break;
      case 3:
        Navigator.pushNamed(context, '/my_cards');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomBarBgColor = Theme.of(context).bottomNavigationBarTheme.backgroundColor;
    final systemOverlay = Theme.of(context).appBarTheme.systemOverlayStyle;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: systemOverlay!.copyWith(systemNavigationBarColor: bottomBarBgColor),
      child: WillPopScope(
        onWillPop: () async {
          if (_pop) {
            return true;
          }
          Fluttertoast.showToast(msg: 'Press again to exit the app');
          _pop = true;
          Timer(const Duration(seconds: 2), () {
            _pop = false;
          });
          return false;
        },
        child: Scaffold(
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
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
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
                          foregroundColor: Colors.black, // Text color
                          backgroundColor: Color(0xff9775FA), // Background color
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: SizedBox(
            height: 56,
            child: SlidingClippedNavBar(
              backgroundColor: Colors.white, // Adjust as needed
              onButtonPressed: _onNavigationTap,
              iconSize: 25,
              activeColor: Color(0xff9775FA),
              inactiveColor: const Color(0xff8F959E),
              selectedIndex: _selectedIndex,
              barItems: [
                BarItem(
                  icon: Icons.home,
                  title: 'Home',
                ),
                BarItem(
                  icon: Icons.favorite,
                  title: 'Wishlist',
                ),
                BarItem(
                  icon: Icons.shopping_bag,
                  title: 'Cart',
                ),
                BarItem(
                  icon: Icons.wallet,
                  title: 'My Cards',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
