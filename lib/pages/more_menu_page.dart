import 'package:eruit_app/const.dart';
import 'package:eruit_app/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'contact_us_page.dart';

class MoreMenuPage extends StatelessWidget {
  const MoreMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/logo.png"),
            const SizedBox(height: 40),
            const Text(
              "Menu",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            Theme(
              data: ThemeData(
                // splashColor: kpColor,
                highlightColor: kpColor.withOpacity(.5),
              ),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                contentPadding: EdgeInsets.zero,
                onTap: () {
                  print("heelo");
                  // print("object");
                  // authProvider.getUserApi();
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => const AboutUsPage(),
                  //   // AboutUsPage(),
                  // ));
                },
                leading: SvgPicture.asset(
                  "assets/icons/users.svg",
                  color: ktextColor,
                ),
                title: const Text("About Us"),
              ),
            ),
            Theme(
              data: ThemeData(
                // splashColor: kpColor,
                highlightColor: kpColor.withOpacity(.5),
              ),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: EdgeInsets.zero,
                onTap: () {},
                leading: SvgPicture.asset("assets/icons/shield.svg"),
                title: const Text("Privacy Policy"),
              ),
            ),
            Theme(
              data: ThemeData(
                // splashColor: kpColor,
                highlightColor: kpColor.withOpacity(.5),
              ),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                contentPadding: EdgeInsets.zero,
                onTap: () {},
                leading: SvgPicture.asset("assets/icons/file-text.svg"),
                title: const Text("T&C"),
              ),
            ),
            Theme(
              data: ThemeData(
                // splashColor: kpColor,
                highlightColor: kpColor.withOpacity(.5),
              ),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                contentPadding: EdgeInsets.zero,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ContactUsPage(),
                    ),
                  );
                },
                leading: SvgPicture.asset("assets/icons/coffee.svg"),
                title: const Text("Contact Us"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
