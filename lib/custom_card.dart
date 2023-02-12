import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CustomCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;
  final double width;
  final double height;
  final String? buttonText;
  final Function? buttonHandler;
  final String? imageSrc;

  const CustomCard({
    required this.icon,
    required this.title,
    required this.subTitle,
    this.width = 400,
    this.height = 200,
    this.buttonText,
    this.buttonHandler,
    this.imageSrc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: width,
        child: Card(
          elevation: 20,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  flex: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(icon),
                      const Spacer(flex: 1),
                      AutoSizeText(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                        maxLines: 1,
                      ),
                      const Spacer(flex: 2),
                      AutoSizeText(
                        subTitle,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                        maxLines: 4,
                      ),
                      if (buttonText != null) ...[
                        const Spacer(flex: 4),
                        ElevatedButton(
                          onPressed: () => buttonHandler ?? {},
                          child: Text(buttonText ?? ""),
                        )
                      ]
                    ],
                  ),
                ),
                if (imageSrc != null) ...[
                  const Spacer(flex: 1),
                  Image.network(
                    imageSrc ?? "",
                    width: 100,
                  )
                ]
              ],
            ),
          ),
        ));
  }
}
