import 'package:flutter/material.dart';

import 'package:side_navigation/side_navigation.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  MainViewState createState() => MainViewState();
}

SideNavigationBarHeader header = SideNavigationBarHeader(
    image: Image.network(
      "https://github.com/ultralytics/assets/blob/main/logo/Ultralytics-logomark-color.png?raw=true",
      width: 50,
      color: const Color(0xFFaaaa00),
    ),
    title: const Text("Clonelytics Hub"),
    subtitle: const Text("Huijae"));

List<Map> menuItems = const [
  {
    'navItem': SideNavigationBarItem(
      icon: Icons.home,
      label: 'Home',
    ),
    'view': Text('Home'),
  },
  {
    'navItem': SideNavigationBarItem(
      icon: Icons.data_array,
      label: 'Datasets',
    ),
    'view': Text('Datasets'),
  },
  {
    'navItem': SideNavigationBarItem(
      icon: Icons.broken_image_rounded,
      label: 'Models',
    ),
    'view': Text('Models'),
  },
];

class MainViewState extends State<MainView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideNavigationBar(
            header: header,
            selectedIndex: selectedIndex,
            items: menuItems
                .map<SideNavigationBarItem>((item) => item['navItem'])
                .toList(),
            onTap: (index) => setState(() {
              selectedIndex = index;
            }),
          ),
          Expanded(
            child: menuItems.elementAt(selectedIndex)['view'],
          )
        ],
      ),
    );
  }
}
