import 'package:flutter/material.dart';
import '../../widgets/bottomNavigationBar/custom_bottom_nav.dart';
import '../history/history_screen.dart';
import '../profile/profile_screen.dart';
import '../service_screen/services.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, this.initialIndex = 0});

  final int initialIndex;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  late int currentIndex;
  Map<String, String>? selectedDoctor;

  late List<Widget> screens;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    screens = [
      const HomeTab(),
      Services(),
      HistoryScreen(
        selectedDoctor: selectedDoctor,
        currentNavIndex: currentIndex,
        onNavTap: _handleNavigation,
      ),
      ProfileScreen(

        currentIndex: currentIndex,

        onTap: _handleNavigation,

      ),
    ];
  }

  void _handleNavigation(int index) {
    setState(() {
      currentIndex = index;
      // Update the HistoryScreen with current selected doctor and nav index
      screens[2] = HistoryScreen(
        selectedDoctor: selectedDoctor,
        currentNavIndex: index,
        onNavTap: _handleNavigation,
      );

      /// update ProfileScreen index also
      screens[3] = ProfileScreen(

        currentIndex: index,

        onTap: _handleNavigation,

      );
    });
  }


  void _setSelectedDoctor(Map<String, String> doctor) {
    setState(() {
      selectedDoctor = doctor;
      // Update HistoryScreen with the selected doctor
      screens[2] = HistoryScreen(
        selectedDoctor: selectedDoctor,
        currentNavIndex: currentIndex,
        onNavTap: _handleNavigation,
      );
    });
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
        onTap: _handleNavigation,
      ),
    );
  }
}