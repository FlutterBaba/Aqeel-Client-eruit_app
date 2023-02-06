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
  void initState() {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    authProvider.profilefirstName.text = authProvider.profileModel!.firstName;
    authProvider.profilelastName.text = authProvider.profileModel!.lastName;
    authProvider.profileuserName.text = authProvider.profileModel!.userName;
    authProvider.profileemail.text = authProvider.profileModel!.email;
    authProvider.profilephone.text = authProvider.profileModel!.phone;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
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
                          ? authProvider.profileModel!.profilePic.isEmpty
                              ? Image.asset("assets/images/no-image.png")
                              : Image.network(
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
                  controller: authProvider.profilefirstName,
                  decoration: const InputDecoration(labelText: "First name"),
                ),
                TextField(
                  controller: authProvider.profilelastName,
                  decoration: const InputDecoration(labelText: "Last name"),
                ),
                TextField(
                  controller: authProvider.profileuserName,
                  decoration: const InputDecoration(labelText: "User name"),
                ),
                TextField(
                  controller: authProvider.profileemail,
                  decoration: const InputDecoration(labelText: "Email"),
                ),
                TextField(
                  controller: authProvider.profilephone,
                  decoration: const InputDecoration(labelText: "Phone"),
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            if (imageFile != null) {
                              setState(() {
                                authProvider.image = imageFile;
                              });
                            }
                            authProvider.updateProfile();
                          },
                          child: authProvider.isprofileLoadoing
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text("Save"),
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
