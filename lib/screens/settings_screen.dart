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
              color: Colors.amber,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(
            height: 48,
          ),
          buildSettingsItem("Icons.help", 'Help'),
          const CustomDivider(),
          buildSettingsItem(".rate", 'Rate Us'),
          const CustomDivider(),
          buildSettingsItem(".share", 'Share With Friends'),
          const CustomDivider(),
          buildSettingsItem("tos", 'Terms Of Use'),
          const CustomDivider(),
          buildSettingsItem("pp", 'Privacy Policy'),
          const CustomDivider(),
          buildSettingsItemVersion("AssetsImages", 'OS Version'),
        ],
      ),
      bottomNavigationBar: const DogBottomSheet(imageUrl: 'dog.imageUrl', selectedIndex: 1),
      );
  }

  Widget buildSettingsItem(String icon, String title) {
    return ListTile(
      leading: Image.asset(
        'assets/images/mami.jpg',
        height: 32,
      ),
      title: Text(
        title,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.amber,
      ),
    );
  }

  Widget buildSettingsItemVersion(String icon, String title) {
    return ListTile(
      leading: Image.asset(
        'assets/images/mami.jpg',
        height: 32,
      ),
      title: Text(
        title,
      ),
      trailing: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Text("");
          }
          return Text(
            "v${snapshot.data!}"
          );
        }, future: null,
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
