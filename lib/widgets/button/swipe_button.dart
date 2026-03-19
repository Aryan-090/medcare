import 'package:flutter/material.dart';
import 'package:medcare/utils/app_colors.dart';

class SwipeButton extends StatefulWidget {
  final VoidCallback onComplete;
  final String text;

  const SwipeButton({
    super.key,
    required this.onComplete,
    required this.text,
  });

  @override
  State<SwipeButton> createState() => _SwipeButtonState();
}

class _SwipeButtonState extends State<SwipeButton> {
  double dragPosition = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth - 60;

        return Container(
          height: 55,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [

              /// TEXT
              Center(
                child: Text(
                  widget.text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              /// DRAG BUTTON
              Positioned(
                left: dragPosition,
                child: GestureDetector(
                  onHorizontalDragUpdate: (details) {
                    setState(() {
                      dragPosition += details.delta.dx;
                      if (dragPosition < 0) dragPosition = 0;
                      if (dragPosition > maxWidth) {
                        dragPosition = maxWidth;
                      }
                    });
                  },
                  onHorizontalDragEnd: (details) {
                    if (dragPosition > maxWidth * 0.8) {
                      /// COMPLETE
                      widget.onComplete();
                    } else {
                      /// RESET
                      setState(() {
                        dragPosition = 0;
                      });
                    }
                  },
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}