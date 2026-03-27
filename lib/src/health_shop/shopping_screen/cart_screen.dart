import 'package:flutter/material.dart';
import 'package:medcare/src/health_shop/shopping_screen/widget/empty_cart_widget.dart';
import '../../../utils/app_colors.dart';
import '../../../widgets/button/primary_button_widget.dart';
import 'cart_manager.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartItems = CartManager.cartItems;

    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  /// header
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },

                        icon: const Icon(Icons.arrow_back_ios_new, size: 18),
                      ),

                      const Expanded(
                        child: Center(
                          child: Text(
                            "Cart",

                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 40),
                    ],
                  ),

                  const Divider(),

                  const SizedBox(height: 10),

                  /// delivery row
                  const Row(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundImage: AssetImage("assets/doctors/doc1.png"),
                      ),

                      SizedBox(width: 10),

                      Text(
                        "Delivery to Amy",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),

                      Spacer(),

                      Text(
                        "Milan, Italy",
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      Icon(Icons.keyboard_arrow_down, size: 18),
                    ],
                  ),

                  const SizedBox(height: 15),

                  /// if cart empty
                  if (cartItems.isEmpty)
                    const EmptyCartWidget()
                  else
                    Expanded(
                      child:
                          cartItems.isEmpty
                              ? const EmptyCartWidget()
                              : ListView.builder(
                                itemCount: cartItems.length,

                                itemBuilder: (context, index) {
                                  final item = cartItems[index];

                                  return cartItem(item, index);
                                },
                              ),
                    ),

                  const SizedBox(height: 80),
                ],
              ),
            ),

            /// bottom button
            if (cartItems.isNotEmpty)
              Positioned(
                left: 16,
                right: 16,
                bottom: 20,

                child: PrimaryButtonWidget(onTap: () {}, title: "Continue"),
              ),
          ],
        ),
      ),
    );
  }

  Widget cartItem(Map<String, dynamic> item, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),

      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(14),

        border: Border.all(color: AppColors.containerBorder),
      ),

      child: Row(
        children: [
          Image.asset(item["image"], height: 45, width: 45),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  item["title"],

                  maxLines: 1,

                  overflow: TextOverflow.ellipsis,

                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),

                const SizedBox(height: 3),

                const Text(
                  "Per Strip",
                  style: TextStyle(fontSize: 11, color: AppColors.subText),
                ),

                const SizedBox(height: 3),

                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Start from ",
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.disableText,
                        ),
                      ),

                      TextSpan(
                        text: item["price"],
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Row(
            children: [
              qtyButton(
                icon: Icons.remove,

                onTap: () {
                  if (item["qty"] > 1) {
                    setState(() {
                      item["qty"]--;
                    });
                  }
                },
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),

                child: Text(item["qty"].toString()),
              ),

              qtyButton(
                icon: Icons.add,

                onTap: () {
                  setState(() {
                    item["qty"]++;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget qtyButton({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        height: 28,
        width: 28,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),

          border: Border.all(color: AppColors.primary),
        ),

        child: Icon(icon, size: 16, color: AppColors.primary),
      ),
    );
  }
}
