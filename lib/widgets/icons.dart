import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    required this.img,
    required this.url,
    Key? key,
  }) : super(key: key);
  final String url, img;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(img,color: Colors.grey,),
      onPressed: () {
        openUrl(url);
      },
    );
  }

  void openUrl(String url) async{
    print("pressed");
    if(await canLaunch(url)){
      await launch(url);
    }
    else
    throw "Could not open";
  }
}