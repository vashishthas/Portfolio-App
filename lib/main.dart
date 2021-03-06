import 'package:flutter/material.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/screens/home.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await FlutterDownloader.initialize(
  //   debug: false
  // );
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
          primaryColor: primaryColor,
          scaffoldBackgroundColor: bgColor,
          canvasColor: bgColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.white)
              .copyWith(
                bodyText1: TextStyle(color: bodyTextColor),
                bodyText2: TextStyle(color: bodyTextColor),
              )),
      home: HomeScreen(),
    );
  }
}
