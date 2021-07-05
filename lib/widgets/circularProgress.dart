import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';
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
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
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
                    backgroundColor: darkColor,
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
      ),
    );
  }
}