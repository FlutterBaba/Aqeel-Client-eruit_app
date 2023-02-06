import 'dart:io';

import 'package:eruit_app/const.dart';
import 'package:eruit_app/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  File? imageFile;

  /// Get from gallery
  _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    firstName.text = authProvider.profileModel!.firstName;
    lastName.text = authProvider.profileModel!.lastName;
    userName.text = authProvider.profileModel!.userName;
    email.text = authProvider.profileModel!.email;
    phone.text = authProvider.profileModel!.phone;

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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      margin: const EdgeInsets.all(6),
                      height: 100,
                      width: 100,
                      child: imageFile == null
                          ? Image.network(
                              authProvider.profileModel!.profilePic,
                              fit: BoxFit.cover,
                            )
                          : Image.file(
                              imageFile!,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _getFromGallery();
                  },
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
            child: OverflowBar(
              overflowSpacing: 20,
              children: [
                TextField(
                  controller: firstName,
                  decoration: const InputDecoration(labelText: "First name"),
                ),
                TextField(
                  controller: lastName,
                  decoration: const InputDecoration(labelText: "Last name"),
                ),
                TextField(
                  controller: userName,
                  decoration: const InputDecoration(labelText: "User name"),
                ),
                TextField(
                  controller: email,
                  decoration: const InputDecoration(labelText: "Email"),
                ),
                TextField(
                  controller: phone,
                  decoration: const InputDecoration(labelText: "Phone"),
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            authProvider.updateProfile(
                              userName: userName.text,
                              image: imageFile!,
                              firstName: firstName.text,
                              lastName: lastName.text,
                              email: email.text,
                              phone: phone.text,
                            );
                          },
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
