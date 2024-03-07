import 'package:flutter/material.dart';

class ForageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ForageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      //Title should be Forage with size 24 and white color
      title: const Text('Forage',
          style: TextStyle(fontSize: 24, color: Colors.white)),
      actions: [
        PopupMenuButton(
          itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem(
                child: Text('Main Page'),
              ),
              const PopupMenuItem(
                child: Text('Create'),
              ),
            ];
          },
          color: Colors.white,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
