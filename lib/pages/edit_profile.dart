import 'package:eruit_app/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User profile"),
        leading: const BackButton(),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Align(
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: kborderColor,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(6),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("assets/images/profile.png"),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: kpColor,
                    child: SvgPicture.asset("assets/icons/edit-2.svg"),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const TextField(
                  decoration: InputDecoration(labelText: "First name"),
                ),
                const SizedBox(height: 20),
                const TextField(
                  decoration: InputDecoration(labelText: "Last name"),
                ),
                const SizedBox(height: 20),
                const TextField(
                  decoration: InputDecoration(labelText: "User name"),
                ),
                const SizedBox(height: 20),
                const TextField(
                  decoration: InputDecoration(labelText: "Email"),
                ),
                const SizedBox(height: 20),
                const TextField(
                  decoration: InputDecoration(labelText: "Phone"),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text("Save"),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: SizedBox(
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(color: Colors.black),
                            ),
                            backgroundColor: const Color(0xffF9FAFB),
                          ),
                          child: const Text(
                            "Clear",
                            style: TextStyle(color: ktextColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
