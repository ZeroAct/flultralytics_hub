import 'package:flutter/material.dart';
import 'package:side_navigation/side_navigation.dart';

class SideMenu extends StatelessWidget {
  final SideNavigationBarHeader header;
  final List<SideNavigationBarItem> items;
  final int selectedIndex;
  final Function tapHandler;

  const SideMenu(
      {required this.header,
      required this.items,
      required this.selectedIndex,
      required this.tapHandler,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SideNavigationBar(
      header: header,
      selectedIndex: selectedIndex,
      items: items,
      onTap: (index) {
        tapHandler(index);
      },
    );
  }
}
