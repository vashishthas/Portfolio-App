import 'package:flutter/material.dart';

import '../constants.dart';

class LinearProgress extends StatelessWidget {
  const LinearProgress({
    Key? key,
    required this.text,
    required this.percentage,
    required this.hideProgress
  }) : super(key: key);
  final String text;
  final double percentage;
  final bool hideProgress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: hideProgress
      ? Container()
      : TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: percentage),
        duration: defaultDuration,
        builder: (context, double value, child) => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text, style: Theme.of(context).textTheme.subtitle2),
                Text((value * 100).toInt().toString() + "%")
              ],
            ),
            SizedBox(height: defaultPadding / 2),
            LinearProgressIndicator(
              value: value,
              color: primaryColor,
              backgroundColor: darkColor,
            ),
          ],
        ),
      ),
    );
  }
}
