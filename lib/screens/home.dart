import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/screens/upper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        child: Column(children: [
          MyInfo(),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  AreaTextInfo(title: "Residence", text: "India"),
                  AreaTextInfo(title: "Residence", text: "India"),
                  AreaTextInfo(title: "Residence", text: "India"),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Skills",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CircularProgress(
                              percentage: 0.8, text: "Flutter")),
                      SizedBox(
                        width: defaultPadding,
                      ),
                      Expanded(
                          child: CircularProgress(
                              percentage: 0.72, text: "Python")),
                    ],
                  ),
                  Divider(),
                  // SizedBox(height: defaultPadding),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Text(
                  //     "Coding",
                  //     style: Theme.of(context).textTheme.headline5,
                  //   ),
                  // ),
                ],
              ),
            ),
          ))
        ]),
      )),
    );
  }
}

class CircularProgress extends StatelessWidget {
  const CircularProgress({
    Key? key,
    required this.percentage,
    required this.text,
  }) : super(key: key);

  final double percentage;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: percentage),
            duration: defaultDuration,
            builder: (context, double value, child) => Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: value,
                  color: primaryColor,
                ),
                Center(
                  child: Text((value * 100).toInt().toString() + "%",
                      style: Theme.of(context).textTheme.subtitle1),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: defaultPadding / 2),
        Text(
          text,
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ],
    );
  }
}

class AreaTextInfo extends StatelessWidget {
  const AreaTextInfo({Key? key, required this.title, required this.text})
      : super(key: key);

  final String title, text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        Text(text, style: TextStyle(fontSize: 18))
      ]),
    );
  }
}
