import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';

class MyInfo extends StatelessWidget {
  const MyInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 140 / 100,
        child: Container(
          color: lightColor,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Spacer(flex: 2),
                CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),
                Spacer(),
                Text(
                  "Vashishtha Siyaram",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white),
                ),
                SizedBox(height: 5),
                Text("App developer || ML enthusiast",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white)),
                Spacer(flex: 2),
              ]),
        ));
  }
}
