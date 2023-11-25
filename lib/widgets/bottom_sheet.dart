import 'package:flutter/material.dart';
import 'package:dogapi_flutter_bloc/screens/settings_screen.dart';

class DogBottomSheet extends StatelessWidget {
  final int selectedIndex;

  const DogBottomSheet({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 98,
      child: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedLabelStyle: const TextStyle(
          color: Color(0xFF0054D3),
          fontSize: 11,
          fontFamily: 'Galano Grotesque',
          fontWeight: FontWeight.w600,
          height: 0,
          letterSpacing: 0.22,
        ),
        unselectedLabelStyle: const TextStyle(
          color: Colors.black,
          fontSize: 11,
          fontFamily: 'Galano Grotesque',
          fontWeight: FontWeight.w600,
          height: 0,
          letterSpacing: 0.22,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              showModalBottomSheet(
                context: context,
                builder: (context) => const SettingsScreen(),
                isScrollControlled: true,
                useSafeArea: true,
                useRootNavigator: true,
              );
            }
          }
        },
      ),
    );
  }
}
