import 'package:flutter/material.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/screens/pdfView.dart';
import 'package:portfolio/screens/upper.dart';
import 'package:portfolio/widgets/circularProgress.dart';
import 'package:portfolio/widgets/icons.dart';
import 'package:portfolio/widgets/linearProgress.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ScrollController _scrollController;
  bool _hideProgress = true;

  @override
  void initState() {
    super.initState();
    bool offset = true;
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset >= 40 && offset) {
        setState(() {
          _hideProgress = false;
          print(_hideProgress.toString() + "Hide called");
          offset = false;
        });
      }
      if (_scrollController.offset < 40 && offset == false) {
        offset = true;
        setState(() {
          _hideProgress = true;
          print(_hideProgress.toString() + "show called");
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        child: Column(children: [
          MyInfo(),
          Expanded(
              child: ListView(
            controller: _scrollController,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    AreaTextInfo(title: "Residence", text: "India"),
                    AreaTextInfo(title: "City", text: "Lucknow"),
                    AreaTextInfo(title: "Age", text: "21"),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Skills",
                          style: Theme.of(context).textTheme.headline5,
                        ),
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
                                percentage: 0.72, text: "Flask")),
                      ],
                    ),
                    Divider(),
                    SizedBox(height: defaultPadding),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Coding",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          LinearProgress(
                            text: "Java",
                            percentage: 0.68,
                            hideProgress: _hideProgress,
                          ),
                          LinearProgress(
                            text: "Git",
                            percentage: 0.70,
                            hideProgress: _hideProgress,
                          ),
                          LinearProgress(
                            text: "C++",
                            percentage: 0.76,
                            hideProgress: _hideProgress,
                          ),
                          LinearProgress(
                            text: "Python",
                            percentage: 0.77,
                            hideProgress: _hideProgress,
                          ),
                          LinearProgress(
                            text: "Dart",
                            percentage: 0.79,
                            hideProgress: _hideProgress,
                          )
                        ],
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PdfView()),
                                );
                              },
                              child: FittedBox(
                                child: Text('Resume',
                                    style:
                                        Theme.of(context).textTheme.subtitle1),
                              )),
                          // IconButton(
                          //   onPressed: () {},
                          //   icon: SvgPicture.asset("assets/icons/download.svg"),
                          // )
                        ],
                      ),
                    ),
                    Container(
                      color: Color(0xFF24242E),
                      // height: 50,
                      child: Row(children: [
                        Spacer(),
                        SocialButton(
                            img: "assets/icons/linkedin.svg",
                            url:
                                "https://www.linkedin.com/in/vashishtha-siyaram/"),
                        SocialButton(
                            img: "assets/icons/hackerrank.svg",
                            url: "https://www.hackerrank.com/vashishthaS"),
                        SocialButton(
                            img: "assets/icons/github.svg",
                            url: "https://github.com/vashishthas"),
                        Spacer()
                      ]),
                    )
                  ],
                ),
              ),
            ],
          ))
        ]),
      )),
    );
  }

  // void downloadFile() async {
  //   final status = await Permission.storage.request();
  //   if (status.isGranted) {
  //     final extDir = await getExternalStorageDirectory();
  //     final id = await FlutterDownloader.enqueue(
  //       url:
  //           // "https://firebasestorage.googleapis.com/v0/b/storage-3cff8.appspot.com/o/2020-05-29%2007-18-34.mp4?alt=media&token=841fffde-2b83-430c-87c3-2d2fd658fd41",
  //           "https://drive.google.com/file/d/153XmShDSaZFSXlZDEkULU1_r1q3B3zDb/view?usp=sharing",
  //       savedDir: extDir!.path,
  //       fileName: 'Resume',
  //       showNotification: true,
  //       openFileFromNotification: true,
  //     );
  //   } else {
  //     print("Permission denided");
  //   }
  // }
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
