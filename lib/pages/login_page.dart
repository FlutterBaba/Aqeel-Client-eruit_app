import 'package:eruit_app/const.dart';
import 'package:eruit_app/pages/forgot_password.dart';
import 'package:eruit_app/provider/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscureText = true;
  static TextEditingController firmName = TextEditingController();
  static TextEditingController userName = TextEditingController();
  static TextEditingController passoword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
                  "Login",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 28,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: OverflowBar(
              overflowSpacing: 20,
              children: [
                TextField(
                  controller: firmName,
                  decoration: const InputDecoration(
                    labelText: "Firm name",
                  ),
                ),
                TextField(
                  controller: userName,
                  decoration: const InputDecoration(
                    labelText: "User Id",
                  ),
                ),
                TextField(
                  controller: passoword,
                  obscureText: obscureText,
                  decoration: InputDecoration(
                    labelText: "Password",
                    suffixIcon: IconButton(
                      icon: obscureText
                          ? SvgPicture.asset("assets/icons/eye-off.svg")
                          : SvgPicture.asset("assets/icons/eye.svg"),
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ElevatedButton(
              onPressed: () {
                authProvider.fatchLogin(
                  firmName: firmName.text,
                  password: passoword.text,
                  userName: userName.text,
                  context: context,
                );
              },
              child: authProvider.isLoginLoadding
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : const Text("Login"),
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    );
                  },
                  padding: EdgeInsets.zero,
                  child: const Text(
                    "Sign up",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: kpColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                CupertinoButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ForgotPassword(),
                    ));
                  },
                  padding: EdgeInsets.zero,
                  child: const Text(
                    "Forgot password?",
                    style: TextStyle(
                      color: ktextColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
