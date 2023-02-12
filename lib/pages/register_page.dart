import 'package:eruit_app/const.dart';
import 'package:eruit_app/models/create_user.dart';
import 'package:eruit_app/pages/login_page.dart';
import 'package:eruit_app/provider/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  static TextEditingController userName = TextEditingController();
  static TextEditingController firstName = TextEditingController();
  static TextEditingController lastName = TextEditingController();
  static TextEditingController firmName = TextEditingController();
  static TextEditingController password = TextEditingController();
  static TextEditingController email = TextEditingController();
  static TextEditingController phone = TextEditingController();
  static TextEditingController createdOn = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
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
                Row(
                  children: const [
                    Text(
                      "Welcome to\t",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                      ),
                    ),
                    Text(
                      "Eruit",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                        color: kpColor,
                      ),
                    ),
                  ],
                ),
                const Text(
                  "Registration",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 28,
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: klightTextColor,
                      ),
                    ),
                    const SizedBox(width: 10),
                    CupertinoButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ));
                      },
                      padding: EdgeInsets.zero,
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          fontSize: 15,
                          color: kpColor,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: OverflowBar(
              overflowSpacing: 20,
              children: [
                TextField(
                  controller: userName,
                  decoration: const InputDecoration(labelText: "userName"),
                ),
                TextField(
                  controller: firstName,
                  decoration: const InputDecoration(labelText: "firstName"),
                ),
                TextField(
                  controller: lastName,
                  decoration: const InputDecoration(labelText: "lastName"),
                ),
                TextField(
                  controller: firmName,
                  decoration: const InputDecoration(labelText: "firmName"),
                ),
                TextField(
                  obscureText: true,
                  controller: password,
                  decoration: const InputDecoration(labelText: "password"),
                ),
                TextField(
                  controller: email,
                  decoration: const InputDecoration(labelText: "email"),
                ),
                TextField(
                  controller: phone,
                  decoration: const InputDecoration(labelText: "phone"),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: ElevatedButton(
              child: authProvider.isSignUpLoadding
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : const Text("Register"),
              onPressed: () {
                authProvider.fatchCreateUser(
                  CreateUserModel(
                    userName: userName.text,
                    firstName: firstName.text,
                    lastName: lastName.text,
                    firmName: firmName.text,
                    password: password.text,
                    email: email.text,
                    phone: phone.text,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
