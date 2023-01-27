import 'package:eruit_app/pages/register_page.dart';
import 'package:eruit_app/provider/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'const.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        title: 'Eruit-Mobile-App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          iconTheme: const IconThemeData(color: ktextColor),
          cupertinoOverrideTheme: const NoDefaultCupertinoThemeData(
              primaryColor: ktextColor,
              textTheme: CupertinoTextThemeData(
                primaryColor: ktextColor,
              )),
          scaffoldBackgroundColor: Colors.white,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: ktextColor,
                fontSizeDelta: 1.2,
                fontFamily: "Poppins",
              ),
          fontFamily: "Poppins",
          primaryColor: kpColor,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
              backgroundColor: kpColor,
              fixedSize: const Size.fromHeight(48),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            suffixIconColor: klightTextColor,
            alignLabelWithHint: true,
            labelStyle: const TextStyle(color: klightTextColor),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: kborderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: ktextColor),
            ),
          ),
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(
              color: ktextColor,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        home: const RegisterPage(),
        // home: const DemoApp(),
        // home: const SplishScreen(),
      ),
    );
  }
}
