import 'package:eruit_app/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("About Us"),
      ),
      body: Column(
        children: [
          const Divider(),
          Expanded(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: RotatedBox(
                    quarterTurns: -2,
                    child: SvgPicture.asset("assets/images/design-image.svg"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/image2.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 40),
                  Text(
                    "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ",
                    style: TextStyle(
                      color: klightTextColor,
                    ),
                  ),
                  SizedBox(height: 40),
                  Text(
                    "It was popularised in the 1960s with the release of Letraset sheets containing.",
                    style: TextStyle(
                      color: klightTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
