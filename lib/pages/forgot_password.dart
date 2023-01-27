import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/images/us.svg"),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/logo.png"),
                const SizedBox(height: 40),
                const Text(
                  "Forgot Password",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 28,
                  ),
                ),
                const Text(
                  "Enter your email address to retrieve your password",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    height: 1.6,
                    color: Color(0xff7E8299),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: const [
                TextField(decoration: InputDecoration(labelText: "Firm name")),
                SizedBox(height: 20),
                TextField(decoration: InputDecoration(labelText: "Username")),
                SizedBox(height: 20),
                TextField(decoration: InputDecoration(labelText: "Email")),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: ElevatedButton(
              child: const Text("Send"),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
