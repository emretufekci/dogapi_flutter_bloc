import 'package:dogapi_flutter_bloc/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:dogapi_flutter_bloc/screens/home_screen.dart';

class DogBottomSheet extends StatelessWidget {
  final String imageUrl;
  final int selectedIndex;

  const DogBottomSheet({Key? key, required this.imageUrl, required this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: ListTile(
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
              ),
              Expanded(
                child: ListTile(
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
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const SettingsScreen()),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
