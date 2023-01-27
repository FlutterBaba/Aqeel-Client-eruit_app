import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Contact Us"),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const Divider(),
          Align(
            alignment: Alignment.topRight,
            child: RotatedBox(
                quarterTurns: -7,
                child: SvgPicture.asset("assets/images/design-image.svg")),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Transform.translate(
                  offset: const Offset(0, -20),
                  child: const TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      label: Text("Full Name"),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const TextField(
                  decoration: InputDecoration(
                    label: Text("Email/Phone number"),
                  ),
                ),
                const SizedBox(height: 20),
                const TextField(
                  maxLines: 3, // <-- SEE HERE
                  minLines: 3, // <-- SEE HERE
                  decoration: InputDecoration(
                    hintMaxLines: 3,
                    label: Text("Message"),
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Submit"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
