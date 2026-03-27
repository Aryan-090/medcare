import 'package:flutter/material.dart';
import 'package:medcare/widgets/button/primary_button_widget.dart';
import '../../../../utils/app_colors.dart';
import '../cart_manager.dart';
import '../cart_screen.dart';

class AddToCartCard extends StatefulWidget {
  final Map<String, dynamic> medicine;

  const AddToCartCard({super.key, required this.medicine});

  @override
  State<AddToCartCard> createState() => _AddToCartCardState();
}

class _AddToCartCardState extends State<AddToCartCard> {
  int qty = 1;

  @override
  Widget build(BuildContext context) {
    final medicine = widget.medicine;

    return Container(
      height: 286,
      width: 428,
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),

      decoration: const BoxDecoration(
        color: AppColors.background,

        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),

        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 12,
            offset: Offset(0, -4),
          ),
        ],
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// drag handle
          Container(
            height: 4,
            width: 40,
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 20),

          /// medicine card
          Container(
            height: 140,
            width: 380,
            padding: const EdgeInsets.all(12),

            decoration: BoxDecoration(
              color: AppColors.background,

              borderRadius: BorderRadius.circular(14),

              boxShadow: const [
                BoxShadow(
                  color: AppColors.shadow,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),

            child: Row(
              children: [
                /// image auto from medicine map
                Image.asset(medicine["image"] ?? "", height: 119, width: 94),

                const SizedBox(width: 30),

                /// title + price
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        medicine["title"] ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),

                      const SizedBox(height: 4),

                      const Text(
                        "Per Strip",
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.disableText,
                        ),
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
                              text: medicine["price"] ?? "",
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      /// quantity selector
                      Row(
                        children: [
                          qtyButton(
                            icon: Icons.remove,
                            onTap: () {
                              if (qty > 1) {
                                setState(() => qty--);
                              }
                            },
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),

                            child: Text(
                              qty.toString(),
                              style: const TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),

                          qtyButton(
                            icon: Icons.add,
                            onTap: () {
                              setState(() => qty++);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          /// main add button
          SizedBox(
            width: double.infinity,
            height: 50,
            child: PrimaryButtonWidget(
              onTap: () {
                /// store item in cart
                CartManager.addItem({

                  "image": medicine["image"],
                  "title": medicine["title"],
                  "price": medicine["price"],

                });

                /// close bottom sheet
                Navigator.pop(context);

                /// go to cart screen
                Navigator.push(

                  context,

                  MaterialPageRoute(
                    builder: (context) => const CartScreen(),
                  ),

                );
              },

              title: "Add To Cart",
            ),
          ),
        ],
      ),
    );
  }

  Widget qtyButton({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        height: 32,
        width: 32,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),

          border: Border.all(color: AppColors.primary),
        ),

        child: Icon(icon, size: 18, color: AppColors.primary),
      ),
    );
  }
}
