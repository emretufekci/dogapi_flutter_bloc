// widgets/bottom_sheet.dart

import 'package:dogapi_flutter_bloc/screens/home_screen.dart';
import 'package:flutter/material.dart';

class DogBottomSheet extends StatelessWidget {
  final String imageUrl;

  const DogBottomSheet({super.key, required this.imageUrl, required this.selectedIndex});


  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {}, // Add any necessary closing logic here
      builder: (BuildContext context) {
        return Container(
          height: 120,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.home),
                title: Text(
                  'Home',
                  style: TextStyle(
                    color: selectedIndex == 0 ? const Color(0xFF0054D3) : Colors.black,
                    fontSize: 11,
                    fontFamily: 'Galano Grotesque',
                    fontWeight: FontWeight.w600,
                    height: 0,
                    letterSpacing: 0.22,
                  ),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: Text(
                  'Settings',
                  style: TextStyle(
                    color: selectedIndex == 1 ? const Color(0xFF0054D3) : Colors.black,
                    fontSize: 11,
                    fontFamily: 'Galano Grotesque',
                    fontWeight: FontWeight.w600,
                    height: 0,
                    letterSpacing: 0.22,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => const HomePage(), //SettingsPage(),
                    isScrollControlled: true,
                    useSafeArea: true,
                    useRootNavigator: true,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
