import 'package:eruit_app/pages/bottom_bar.dart';
import 'package:eruit_app/pages/login_page.dart';
import 'package:eruit_app/pages/splash_page.dart';
import 'package:eruit_app/provider/auth_provider.dart';
import 'package:eruit_app/provider/login_provider.dart';
import 'package:eruit_app/provider/order_provider/order_provider.dart';
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
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
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
            ),
          ),
          scaffoldBackgroundColor: Colors.white,
          textTheme: Theme.of(context).textTheme.apply(
              bodyColor: ktextColor, fontSizeDelta: 1.2, fontFamily: "Poppins"),
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
        // home: const LoginPage(),
        home: const SplishScreen(),
        // home: const Yaqoob(),
        // home: YaqoobTest(),
        // home: const ForgotPassword(),
        // home: const DemoApp(),
        // home: const SplishScreen(),
      ),
    );
  }
}

class TokenAccess extends StatefulWidget {
  const TokenAccess({super.key});

  @override
  State<TokenAccess> createState() => _TokenAccessState();
}

class _TokenAccessState extends State<TokenAccess> {
  @override
  void initState() {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    authProvider.getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return authProvider.bearerToken == ""
        ? const LoginPage()
        : const BottomBar();
  }
}
