import 'package:eruit_app/const.dart';
import 'package:eruit_app/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'edit_profile.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  TextEditingController password = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  AuthProvider? authProvider;
  bool passwordobscureText = true;
  bool newPassowrdobscureText = true;

  showDeleteAlert(BuildContext context) {
    // show the dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            AuthProvider auth = Provider.of<AuthProvider>(context);
            return AlertDialog(
              title: const Text("Delete?"),
              content:
                  const Text("Are you sure you want ti delete this account?"),
              actions: [
                auth.isDeleteLoading
                    ? const CircularProgressIndicator()
                    : TextButton(
                        child: const Text("OK"),
                        onPressed: () async {
                          await auth.deleteUserAccount();
                          if (auth.successfulDelete == true) {
                            auth.successfulDelete = false;
                            await auth.logOut(context);
                          }
                        },
                      ),
                TextButton(
                  child: const Text("Cancel"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

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
                  return StatefulBuilder(
                    builder: (context, setState) {
                      AuthProvider auth = Provider.of<AuthProvider>(context);
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
                                    password.clear();
                                    newPassword.clear();
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
                                      controller: password,
                                      obscureText: passwordobscureText,
                                      decoration: InputDecoration(
                                        labelText: "Password",
                                        suffixIcon: IconButton(
                                          icon: passwordobscureText
                                              ? SvgPicture.asset(
                                                  "assets/icons/eye-off.svg")
                                              : SvgPicture.asset(
                                                  "assets/icons/eye.svg"),
                                          onPressed: () {
                                            setState(() {
                                              passwordobscureText =
                                                  !passwordobscureText;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    TextField(
                                      controller: newPassword,
                                      obscureText: newPassowrdobscureText,
                                      decoration: InputDecoration(
                                        labelText: "New passwrod",
                                        suffixIcon: IconButton(
                                          icon: newPassowrdobscureText
                                              ? SvgPicture.asset(
                                                  "assets/icons/eye-off.svg")
                                              : SvgPicture.asset(
                                                  "assets/icons/eye.svg"),
                                          onPressed: () {
                                            setState(() {
                                              newPassowrdobscureText =
                                                  !newPassowrdobscureText;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          await auth.fatchChangePassword(
                                            oldPassword: password.text,
                                            newPassword: newPassword.text,
                                          );
                                          if (auth.successfulChangePassword ==
                                              true) {
                                            password.clear();
                                            newPassword.clear();
                                            auth.successfulChangePassword =
                                                false;
                                            Navigator.of(context).pop();
                                          }
                                        },
                                        child: auth.isloadingchangePassword
                                            ? const CircularProgressIndicator(
                                                color: Colors.white,
                                              )
                                            : const Text("Submit"),
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
                  );
                },
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    authProvider = Provider.of<AuthProvider>(context);
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
                    border: Border.all(
                      width: 2,
                      color: kborderColor,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      margin: const EdgeInsets.all(6),
                      height: 100,
                      width: 100,
                      child: authProvider!.profileModel!.profilePic.isEmpty
                          ? Image.asset("assets/images/no-image.png")
                          : Image.network(
                              authProvider!.profileModel!.profilePic,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  authProvider!.profileModel!.firstName,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 19,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  authProvider!.profileModel!.email,
                  style: const TextStyle(
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
                    print("Edit");
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
                TextInputt(
                  labelText: "First name",
                  text: authProvider!.profileModel!.firstName,
                ),
                TextInputt(
                  labelText: "Last name",
                  text: authProvider!.profileModel!.lastName,
                ),
                TextInputt(
                  labelText: "User Name",
                  text: authProvider!.profileModel!.userName,
                ),
                TextInputt(
                  labelText: "Phone",
                  text: authProvider!.profileModel!.phone,
                ),
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
                          onTap: () {
                            showDeleteAlert(context);
                          },
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: SvgPicture.asset("assets/icons/log-out.svg"),
                          title: const Text("Sign out"),
                          onTap: () {
                            authProvider!.logOut(context);
                          },
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
  final String labelText;
  final String text;
  const TextInputt({
    super.key,
    required this.labelText,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText.toString()),
        const SizedBox(height: 6),
        Text(
          text.toString(),
          style: const TextStyle(
            color: klightTextColor,
          ),
        ),
        const Divider(thickness: 1.6),
      ],
    );
  }
}
