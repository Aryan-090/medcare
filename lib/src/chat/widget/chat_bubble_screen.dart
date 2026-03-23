import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isMe;
  final String? time;

  const ChatBubble({
    super.key,
    required this.text,
    required this.isMe,
    this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (time != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              time!,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ),
        Align(
          alignment:
          isMe ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 6),
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 12,
            ),
            constraints: const BoxConstraints(maxWidth: 270),
            decoration: BoxDecoration(
              color: isMe
                  ?  AppColors.primary
                  : AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(18),
                topRight: const Radius.circular(18),
                bottomLeft: isMe
                    ? const Radius.circular(18)
                    : const Radius.circular(6),
                bottomRight: isMe
                    ? const Radius.circular(6)
                    : const Radius.circular(18),
              ),
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: isMe ? Colors.white : Colors.black87,
                height: 1.4,
              ),
            ),
          ),
        ),
      ],
    );
  }
}