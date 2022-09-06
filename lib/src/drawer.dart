import 'package:flutter/material.dart';
import 'package:gimmic/assets/label.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            onTap: () => Navigator.pop(context),
            title: const Text(StringResource.resource),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(StringResource.about),
          ),
        ],
      ),
    );
  }
}
