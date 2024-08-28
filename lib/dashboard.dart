import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:laza/Contactus.dart';
import 'package:laza/aboutus.dart';
import 'package:laza/cart_screen.dart';
import 'package:laza/components/colors.dart';
import 'package:laza/components/drawer.dart';
import 'package:laza/extensions/context_extension.dart';
import 'package:laza/home_screen.dart';
import 'package:laza/my_cards_screen.dart';
import 'package:laza/wishlist_screen.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

var dashboardScaffoldKey = GlobalKey<ScaffoldState>();

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final PageController pageController = PageController();
  int selectedIndex = 0;
  bool pop = false;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    final bottomBarBgColor = context.theme.bottomNavigationBarTheme.backgroundColor;
    final systemOverlay = context.theme.appBarTheme.systemOverlayStyle;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: systemOverlay!.copyWith(systemNavigationBarColor: bottomBarBgColor),
      child: WillPopScope(
        onWillPop: () async {
          if (Platform.isIOS) {
            return true;
          }
          if (pop) {
            return true;
          }
          Fluttertoast.showToast(msg: 'Press again to exit the app');
          pop = true;
          Timer(const Duration(seconds: 2), () {
            pop = false;
          });
          return false;
        },
        child: Scaffold(
          key: dashboardScaffoldKey,
          drawer: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5.0,
              sigmaY: 5.0,
            ),
            child: const DrawerWidget(),
          ),
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                selectedIndex = index;
                _page = index; // Syncing with _page
              });
            },
            children: [
              HomeScreen(),
              WishlistScreen(),
              CartScreen(),
              Contactus(),
              aboutus(),
            ],
          ),
          bottomNavigationBar: CurvedNavigationBar(
            key: _bottomNavigationKey,
            items: const <Widget>[
              Icon(Icons.home, size: 30),
              Icon(Icons.favorite, size: 30),
              Icon(Icons.shopping_cart, size: 30),
              Icon(Icons.phone, size: 30),
              Icon(Icons.people_alt, size: 30),
            ],
            color: bottomBarBgColor ?? Color(0xff9775FA),
            backgroundColor: Colors.white,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
                _page = index;
                pageController.jumpToPage(index);
              });
            },
          ),
        ),
      ),
    );
  }
}
