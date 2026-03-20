import 'package:flutter/material.dart';
import 'package:medcare/utils/app_colors.dart';

class ReviewBottomSheet extends StatefulWidget {
  const ReviewBottomSheet({super.key});

  @override
  State<ReviewBottomSheet> createState() => _ReviewBottomSheetState();
}

class _ReviewBottomSheetState extends State<ReviewBottomSheet> {
  int rating = 0;
  final TextEditingController reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// DRAG HANDLE
          Center(
            child: Container(
              width: 50,
              height: 5,
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          /// TITLE
          const Center(
            child: Text(
              "Review",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(height: 16),

          /// RATING
          const Text("Ratings"),

          const SizedBox(height: 8),

          Row(
            children: List.generate(5, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    rating = index + 1;
                  });
                },
                child: Icon(
                  Icons.star,
                  size: 28,
                  color: index < rating
                      ? Colors.orange
                      : Colors.grey.shade300,
                ),
              );
            }),
          ),

          const SizedBox(height: 16),

          /// REVIEW INPUT
          const Text("Your review"),

          const SizedBox(height: 8),

          TextField(
            controller: reviewController,
            maxLines: 4,
            decoration: InputDecoration(
              hintText: "Write your review",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          const SizedBox(height: 20),

          /// BUTTONS
          Row(
            children: [

              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                  ),
                  onPressed: () {
                    print("Rating: $rating");
                    print("Review: ${reviewController.text}");
                    Navigator.pop(context);
                  },
                  child: const Text("Submit",style: TextStyle(color: AppColors.white),),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }
}