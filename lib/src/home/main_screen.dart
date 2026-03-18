import 'package:flutter/material.dart';
import 'package:medcare/src/services/services.dart';
import '../../widgets/bottomNavigationBar/custom_bottom_nav.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, this.initialIndex = 0});

  final int initialIndex;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  late int currentIndex;

  final List<Widget> screens = [
    const HomeTab(),
    Services(),
    const Center(child: Text("History")),
    const Center(child: Text("Profile")),
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),

      bottomNavigationBar: CustomBottomNav(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}