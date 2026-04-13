import 'package:flutter/material.dart';
import 'package:medcare/utils/app_colors.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage("assets/doctors/doc2.png"),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Emily Johnson",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "1 day ago",
                    style: TextStyle(color: Colors.grey, fontSize: 11),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: const [
              Icon(Icons.star, size: 14, color: Colors.orange),
              Icon(Icons.star, size: 14, color: Colors.orange),
              Icon(Icons.star, size: 14, color: Colors.orange),
              Icon(Icons.star, size: 14, color: Colors.orange),
              Icon(Icons.star_border, size: 14, color: Colors.orange),
            ],
          ),
          const SizedBox(height: 10),
          RichText(
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            text: const TextSpan(
              style: TextStyle(color: Colors.black54, fontSize: 13, height: 1.4),
              children: [
                TextSpan(text: "My consultation with Dr. Luca Rossi was excellent. He's knowledgeable, attentive, and provid... "),
                TextSpan(
                  text: "More view",
                  style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}