import 'package:flutter/material.dart';
import 'package:medcare/src/chat/widget/chat_bubble_screen.dart';

import '../../utils/app_colors.dart';

class ChatScreen extends StatefulWidget {
  final String title;
  final Map<String, String>? selectedDoctor;

  const ChatScreen({super.key, this.selectedDoctor, this.title = 'chat'});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<Map<String, dynamic>> _messages = [
    {
      "text": "Hello Doctor i would like to schedule an appointment",
      "isMe": true,
      "time": "09:32 PM",
    },
    {
      "text":
          "Hello! Of course, i am glad to assist you. what health concerns are yu experiencing?",
      "isMe": false,
      "time": "09:32 PM",
    },
    {
      "text":
          "i've been experiencing constant headaches over the past few days",
      "isMe": true,
      "time": "09:32 PM",
    },
    {
      "text":
          "I understand. lets schedule your appointment. do you have any specific time preference?",
      "isMe": false,
      "time": "09:32 PM",
    },
    {"text": "Yes!", "isMe": true, "time": "09:32 PM"},
  ];

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;

    setState(() {
      _messages.add({"text": _controller.text.trim(), "isMe": true});
    });

    _controller.clear();

    Future.delayed(const Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F9),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            /// HEADER
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios_new, size: 20),
                  ),
                  const SizedBox(width: 10),
                  CircleAvatar(
                    backgroundImage:
                        widget.selectedDoctor != null
                            ? AssetImage(
                              widget.selectedDoctor!["image"] ??
                                  "assets/img/splash_logo.png",
                            )
                            : const AssetImage("assets/img/splash_logo.png"),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.selectedDoctor?["name"] ?? "Doctor",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 1),
                        Text(
                          widget.selectedDoctor?["speciality"] ?? "Specialist",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.video_call_outlined, size: 24),
                  const SizedBox(width: 10),
                  const Icon(Icons.call_outlined, size: 20),
                ],
              ),
            ),

            /// CHAT LIST
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final msg = _messages[index];

                  return ChatBubble(
                    text: msg["text"],
                    isMe: msg["isMe"],
                    time: msg["time"],
                  );
                },
              ),
            ),

            /// INPUT FIELD
            Container(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
              decoration: const BoxDecoration(color: AppColors.white),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: AppColors.grey.shade300),
                      ),
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          hintText: "Type something...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: _sendMessage,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.grey),

                      ),
                      child:  Icon(
                        Icons.camera_alt,
                        size: 18,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
