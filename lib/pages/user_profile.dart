import 'package:eruit_app/const.dart';
import 'package:eruit_app/pages/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool obscureText = false;
  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
              insetPadding: const EdgeInsets.all(0),
              contentPadding: const EdgeInsets.all(0),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              content: Builder(
                builder: (context) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width - 70,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: SvgPicture.asset(
                                "assets/images/design-image.svg"),
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.close,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          const Text(
                            "Change Password",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 20),
                            child: Column(
                              children: [
                                TextField(
                                  obscureText: obscureText,
                                  decoration: InputDecoration(
                                    labelText: "Password",
                                    suffixIcon: IconButton(
                                      icon: obscureText
                                          ? SvgPicture.asset(
                                              "assets/icons/eye-off.svg")
                                          : SvgPicture.asset(
                                              "assets/icons/eye.svg"),
                                      onPressed: () {
                                        setState(() {
                                          obscureText = !obscureText;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                TextField(
                                  obscureText: obscureText,
                                  decoration: InputDecoration(
                                    labelText: "New passwrod",
                                    suffixIcon: IconButton(
                                      icon: obscureText
                                          ? SvgPicture.asset(
                                              "assets/icons/eye-off.svg")
                                          : SvgPicture.asset(
                                              "assets/icons/eye.svg"),
                                      onPressed: () {
                                        setState(() {
                                          obscureText = !obscureText;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                TextField(
                                  obscureText: obscureText,
                                  decoration: InputDecoration(
                                    labelText: "Confirm password",
                                    suffixIcon: IconButton(
                                      icon: obscureText
                                          ? SvgPicture.asset(
                                              "assets/icons/eye-off.svg")
                                          : SvgPicture.asset(
                                              "assets/icons/eye.svg"),
                                      onPressed: () {
                                        setState(() {
                                          obscureText = !obscureText;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Submit"),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User profile"),
        leading: IconButton(
          icon: Image.asset('assets/logo.png'),
          onPressed: () {},
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: kborderColor),
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
                const SizedBox(height: 10),
                const Text(
                  "Yaqoob Developer",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 19,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  "yaqoobkafeel580@gmail.com",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: klightTextColor,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  icon: const Text("Edit Profile"),
                  label: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const EditProfile(),
                    ));
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "User content",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: ktextColor,
                    fontSize: 19,
                  ),
                ),
                const SizedBox(height: 20),
                const TextInputt(),
                const TextInputt(),
                const TextInputt(),
                const TextInputt(),
                const SizedBox(height: 20),
                const Text(
                  "Account Settings",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: ktextColor,
                    fontSize: 19,
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: ListTile.divideTiles(
                      //          <-- ListTile.divideTiles
                      context: context,
                      tiles: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: SvgPicture.asset("assets/icons/key.svg"),
                          title: const Text("Change Password"),
                          onTap: () {
                            _showMyDialog(context);
                          },
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: SvgPicture.asset("assets/icons/trash.svg"),
                          title: const Text("Delete Account"),
                          onTap: () {},
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: SvgPicture.asset("assets/icons/log-out.svg"),
                          title: const Text("Sign out"),
                          onTap: () {},
                        ),
                      ]).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TextInputt extends StatelessWidget {
  const TextInputt({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("First name"),
        SizedBox(height: 6),
        Text(
          "Elimelech",
          style: TextStyle(
            color: klightTextColor,
          ),
        ),
        Divider(thickness: 1.6),
      ],
    );
  }
}
