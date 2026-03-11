import 'package:flutter/cupertino.dart';

class SplashItemWidget extends StatelessWidget {
  final String img;
  const SplashItemWidget({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(img)
      ],
    );
  }
}
