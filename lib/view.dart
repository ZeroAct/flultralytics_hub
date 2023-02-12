import 'package:flutter/material.dart';

import 'package:side_navigation/side_navigation.dart';
import 'custom_card.dart';

SideNavigationBarHeader header = SideNavigationBarHeader(
    image: Image.network(
      "https://github.com/ultralytics/assets/blob/main/logo/Ultralytics-logomark-color.png?raw=true",
      width: 50,
      color: const Color(0xFFaaaa00),
    ),
    title: const Text("Flultralytics Hub"),
    subtitle: const Text("Huijae"));

List<Map> menuItems = [
  {
    'navItem': const SideNavigationBarItem(
      icon: Icons.home,
      label: 'Home',
    ),
    'view': Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const CustomCard(
            icon: Icons.star_border,
            title: "Get Started with our Easy to Use Tutorial",
            subTitle:
                "Begin your journey with Ultralytics HUB and gain the knowledge and skills needed to effectively utilize its powerful features and capabilities. Please take a moment to leave us feedback using the tab on the right. Your input is invaluable to us.",
            width: 600,
            height: 200,
            buttonText: "Start Tutorial",
            imageSrc:
                "https://github.com/ultralytics/assets/blob/main/logo/Ultralytics-logomark-color.png?raw=true",
          ),
          Row(
            children: const [
              CustomCard(
                icon: Icons.folder,
                title: "Datasets",
                subTitle:
                    "Create a personalized model by utilizing your own dataset and fine-tune your model's performance with the ability to preview the classes and detection labels.",
                width: 300,
                height: 200,
                buttonText: "Upload Dataset",
              ),
              CustomCard(
                icon: Icons.graphic_eq,
                title: "Models",
                subTitle:
                    "Train a custom vision model and monitor its performance in real-time. Once the training is complete, easily export the model in your desired format for deployment.",
                width: 300,
                height: 200,
                buttonText: "Train Model",
              ),
            ],
          ),
        ],
      ),
    ),
  },
  {
    'navItem': const SideNavigationBarItem(
      icon: Icons.folder,
      label: 'Datasets',
    ),
    'view': const Text('Datasets'),
  },
  {
    'navItem': const SideNavigationBarItem(
      icon: Icons.graphic_eq,
      label: 'Models',
    ),
    'view': const Text('Models'),
  },
];

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  MainViewState createState() => MainViewState();
}

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
          Container(
            child: menuItems.elementAt(selectedIndex)['view'],
          )
        ],
      ),
    );
  }
}
