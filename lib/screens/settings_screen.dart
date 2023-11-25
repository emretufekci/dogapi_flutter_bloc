import 'dart:io';

import 'package:dogapi_flutter_bloc/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 8,
          ),
          Container(
            width: 32,
            height: 4,
            decoration: ShapeDecoration(
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(
            height: 48,
          ),
          buildSettingsItem(Icons.info_outline, 'Help'),
          const CustomDivider(),
          buildSettingsItem(Icons.star_border, 'Rate Us'),
          const CustomDivider(),
          buildSettingsItem(Icons.ios_share_outlined, 'Share With Friends'),
          const CustomDivider(),
          buildSettingsItem(Icons.receipt_long_outlined, 'Terms Of Use'),
          const CustomDivider(),
          buildSettingsItem(Icons.privacy_tip_outlined, 'Privacy Policy'),
          const CustomDivider(),
          buildSettingsItemVersion("AssetsImages", 'OS Version'),
        ],
      ),
      bottomNavigationBar: const DogBottomSheet(selectedIndex: 1),
      );
  }

  Widget buildSettingsItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(
        icon,
        size: 32,
        color: Colors.black,
      ),
      title: Text(
        title,
      ),
      trailing: const Icon(
        Icons.turn_slight_right_outlined,
        size: 16,
        color: Colors.black12,
      ),
    );
  }

  Widget buildSettingsItemVersion(String icon, String title) {
    return ListTile(
      leading: const Icon(
        Icons.share_outlined,
        size: 32,
        color: Colors.black,
      ),
      title: Text(
        title,
      ),
      trailing: Text(
          Platform.operatingSystemVersion.split(' ')[1],
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      indent: 16,
      height: 2,
      color: Color(0xFFE5E5EA),
    );
  }
}
