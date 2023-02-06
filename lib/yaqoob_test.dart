import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Yaqoob extends StatelessWidget {
  const Yaqoob({super.key});
  static Gradient appGradientDecoration = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      APPCOLORS().kDarkPurple3,
      APPCOLORS().kDarkPurple4,
    ],
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff19082B),
      bottomNavigationBar: Container(
        height: 450,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff45136D),
              Color(0xff28156A),
            ],
          ),
          // gradient: appGradientDecoration,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            const Text(
              "Input Card Details",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                height: 2.3,
                color: Colors.white,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 4,
                    spreadRadius: 0,
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    offset: Offset(0, 4),
                  ),
                ],
                color: APPCOLORS.kDarkPurple6,
                borderRadius: BorderRadius.circular(10),
              ),
              child: OverflowBar(
                overflowSpacing: 20,
                children: [
                  const BankCardNumber(),
                  Row(
                    children: const [
                      Expanded(
                        child: CvvMMYY(
                          hintText: "CVV",
                          image: "assets/svgicon/cvv_icon.png",
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: CvvMMYY(
                          image: "assets/svgicon/mmy_icon.png",
                          hintText: "MM/YY",
                        ),
                      ),
                    ],
                  ),
                  const BankCardNumber(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class APPCOLORS {
  //////kPurple
  Color kPrimaryColor = const Color(0xff8B25DA);
  Color kPurple1 = const Color(0xffAE67E5);
  Color kPurple2 = const Color(0xff3C146B);
  Color kPurple3 = const Color(0xff6020AC);
  Color kPurple4 = const Color(0xff9353DF);
  Color kPurple5 = const Color(0xff481881);
  Color kPurple6 = const Color(0xff541C96);
  Color kPurple7 = const Color(0xff3C146C);
  Color kPurple8 = const Color(0xff7C28D7);
  Color kPurple9 = const Color(0xff7828D7);
  Color kPurple10 = const Color(0xff4E1A8C);
//////kLightPurple
  Color kLightPurple1 = const Color(0xffC9A9EF);
  Color kLightPurple2 = const Color(0xffC592EC);
  Color kLightPurple3 = const Color(0xffF3E9FB);
  Color kLightPurple = const Color(0xffB97CE9);
  Color kLightPurple4 = const Color(0xffE8D3F8);
////kDarkPurple
  Color kDarkPurple = const Color(0xff45136D);
  Color kDarkPurple2 = const Color(0xff28156A);
  Color kDarkPurple3 = const Color(0xff19082b);
  Color kDarkPurple1 = const Color(0xff301056);
  Color kDarkPurple4 = const Color(0xff0E052E);
  Color kDarkPurple5 = const Color(0xff240C40);
  static Color kDarkPurple6 = const Color(0xff290E49);
  Color kDarkPurple7 = const Color(0xff3C156B);
  Color kDarkPurple8 = const Color(0xff240C41);
////kDarkPurple
  Color kWhite = const Color(0xffFFFFFF);
  Color kGrey = const Color(0xff808080);
  Color kGrey1 = const Color(0xffBFBFBF);
  Color kGrey2 = const Color(0xff484848);
  Color kGrey3 = const Color(0xff8C8C8C);
  Color kGrey4 = const Color(0xff777B88);
  Color kGrey5 = const Color(0xffCCCCCC);
  Color kBlue = const Color(0xff0B4DF8);
  Color kBlue2 = const Color(0xff0812FC);
  Color kblue1 = const Color(0xff502AD5);
  Color kGreen = const Color(0xff80E567);
  Color kGreen2 = const Color(0xff2D7B08);
  Color kGreen3 = const Color(0xff26E12E);
  Color kGreen1 = const Color(0xff45BA77);
  Color kGreen4 = const Color(0xff30C46F);
  Color kRed = const Color(0xffFF4C4D);
  Color kRed1 = const Color(0xffD84D4D);
  Color kBlack = const Color(0xff000000);
}

class BankCardNumber extends StatelessWidget {
  const BankCardNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 2,
          color: APPCOLORS().kPurple4,
        ),
      ),
      child: Row(
        children: [
          Image.asset("assets/svgicon/card_icon.png"),
          const SizedBox(width: 10),
          Container(
            color: Colors.white,
            width: 1,
            height: 35,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Color(0xff666666)),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Bank Card Number",
                hintStyle: TextStyle(
                  color: Color(0xff666666),
                ),
              ),
            ),
          ),
          Image.asset("assets/svgicon/visa_icon.png"),
        ],
      ),
    );
  }
}

class CvvMMYY extends StatelessWidget {
  final String hintText;
  final String image;
  const CvvMMYY({super.key, required this.hintText, required this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 2,
          color: APPCOLORS().kPurple4,
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Image.asset(image),
          const SizedBox(width: 10),
          Container(
            color: Colors.white,
            width: 1,
            height: 35,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(2),
              ],
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Color(0xff666666)),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: Color(0xff666666),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
