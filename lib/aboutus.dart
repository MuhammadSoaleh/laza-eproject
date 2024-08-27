import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class aboutus extends StatefulWidget {
  @override
  _aboutusState createState() => _aboutusState();
}

class _aboutusState extends State<aboutus> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xff9775FA),
            foregroundColor: Colors.black,
        
        title: Center(child: Text(
                "About Us",
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
              ),),
      ),
      body:Stack(
            children: [
              // Background image
              Positioned.fill(
                child: Image.network(
                  "https://images.pexels.com/photos/26834970/pexels-photo-26834970/free-photo-of-a-group-of-people-with-a-laptop.jpeg?auto=compress&cs=tinysrgb&w=600",
                  fit: BoxFit.cover,
                ),
              ),
              // Semi-transparent overlay
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            
               Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Who we are',
              
               style:  TextStyle(height: 0,fontSize: 24,
                  fontWeight: FontWeight.bold,
                     color: Colors.white, // Corrected the color property
),
            ),
            Center(
              child: Text(
                'Welcome to our laptop e-commerce store, where innovation meets technology. Welcome to Laza, your trusted destination for the latest and greatest in laptops. At Laza, we are passionate about technology and committed to providing our customers with a seamless shopping experience. Whether you\'re a student, professional, or tech enthusiast, we offer a wide range of laptops from leading brands to meet your specific needs.\n\n'
                'Our mission is to empower our customers with cutting-edge technology by offering high-quality products at competitive prices. We pride ourselves on our exceptional customer service, ensuring that every purchase is supported by knowledgeable staff and a hassle-free shopping process. From browsing to delivery, we aim to make your experience with Laza as enjoyable and convenient as possible.\n\n'
                'At Laza, we don\'t just sell laptops; we provide solutions. We understand that buying a laptop is an important decision, which is why we are here to guide you every step of the way. Thank you for choosing Laza, where innovation meets reliability.',
              
              style: TextStyle(
                color: Colors.white,
              ),),
            ),

          ],
        ),
      ),
      
  ])  );
  }
}
