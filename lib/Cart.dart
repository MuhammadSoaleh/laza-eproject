import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:laza/components/bottom_nav_button.dart';
import 'package:laza/components/colors.dart';
import 'package:laza/components/custom_appbar.dart';
import 'package:laza/components/laza_icons.dart';
import 'package:laza/extensions/context_extension.dart';
import 'package:laza/order_confirmed_screen.dart';

// Model for Cart Item
class CartItem {
  final String name;
  final double price;
  final double tax;
  final int quantity;
  final String imageUrl;

  CartItem({
    required this.name,
    required this.price,
    required this.tax,
    required this.quantity,
    required this.imageUrl,
  });
}

// Main CartScreen
class Cart extends StatelessWidget {
  final List<CartItem> cartItems;

  const Cart({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: context.theme.appBarTheme.systemOverlayStyle!,
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Cart'),
        bottomNavigationBar: BottomNavButton(
          label: 'Checkout',
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const OrderConfirmedScreen()),
          ),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
          itemCount: cartItems.length,
          itemBuilder: (context, index) {
            final item = cartItems[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: CartItemWidget(item: item),
            );
          },
        ),
      ),
    );
  }
}

// Widget for each Cart Item
class CartItemWidget extends StatelessWidget {
  final CartItem item;

  const CartItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: context.theme.cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: context.theme.scaffoldBackgroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              image: DecorationImage(
                image: AssetImage(item.imageUrl),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          const SizedBox(width: 10.0),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: context.bodySmallW500,
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      "\$${item.price} (-\$${item.tax} Tax)",
                      style: context.bodyExtraSmall?.copyWith(color: ColorConstant.manatee),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: const BorderRadius.all(Radius.circular(50)),
                            onTap: () {
                              // Decrease quantity logic here
                            },
                            child: Ink(
                              width: 30,
                              height: 30,
                              decoration: ShapeDecoration(
                                color: context.theme.scaffoldBackgroundColor,
                                shape: const CircleBorder(),
                              ),
                              child: const Icon(Icons.arrow_drop_down),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15.0),
                        Text('${item.quantity}'),
                        const SizedBox(width: 15.0),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: const BorderRadius.all(Radius.circular(50)),
                            onTap: () {
                              // Increase quantity logic here
                            },
                            child: Ink(
                              width: 30,
                              height: 30,
                              decoration: ShapeDecoration(
                                color: context.theme.scaffoldBackgroundColor,
                                shape: const CircleBorder(),
                              ),
                              child: const Icon(Icons.arrow_drop_up),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: const BorderRadius.all(Radius.circular(50)),
                        onTap: () {
                          // Delete item logic here
                        },
                        child: Ink(
                          width: 30,
                          height: 30,
                          decoration: ShapeDecoration(
                            color: context.theme.scaffoldBackgroundColor,
                            shape: const CircleBorder(),
                          ),
                          child: const Icon(LazaIcons.delete, size: 14.0),
                        ),
                      ),
                    ),
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

// Example usage
void main() {
  runApp(
    MaterialApp(
      home: Cart(
        cartItems: [
          CartItem(
            name: "Men's Tie-Dye T-Shirt Nike Sportswear",
            price: 45.0,
            tax: 4.0,
            quantity: 1,
            imageUrl: 'assets/images/notebook-xps-16-9640-nt-silver-compare-800x550-front.jpg',
          ),
          // Add more items as needed
        ],
      ),
    ),
  );
}
