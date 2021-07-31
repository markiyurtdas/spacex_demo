import 'dart:convert';
import 'package:appnation_spacex/constant/constants.dart';
import 'package:appnation_spacex/model/spacex.dart';
import 'package:appnation_spacex/util/size_config.dart';
import 'package:appnation_spacex/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpaceX Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter SpaceX Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: _isInfoReady
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: SizeConfig.screenWidth * 0.20,
                          child: Image.network(spacex.links.patch!.small!),
                        ),
                        Text(
                          spacex.name,
                          style: customStyles.headTextStyle(),
                        )
                      ],
                    ),
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          height: SizeConfig.screenHeight * 0.4,
                          width: SizeConfig.screenWidth,
                          child: _isImageDataReady
                              ? _imageData
                              : Center(
                                  child: SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: CircularProgressIndicator())),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                prevImage();
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 5),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(180),
                                ),
                                child: Icon(
                                  Icons.chevron_left,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                nextImage();
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 5),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(180),
                                ),
                                child: Icon(
                                  Icons.chevron_right,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("Date: ${spacex.dateUtc}")],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        "Details: ",
                        style: customStyles.headTextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        spacex.details,
                        style: customStyles.normalTextStyle(),
                      ),
                    ),
                  ],
                )
              : CircularProgressIndicator(),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getInfoFromSpacex();
  }

  getInfoFromSpacex() async {
    var response = await http.get(Uri.parse(kInfoUrl));
    spacex = Spacex.fromJson(jsonDecode(response.body.toString()));
    _imageData =
        Image.network(spacex.links.flickr.original[_currentImageIndex]);

    setState(() {
      _isImageDataReady = true;
      _isInfoReady = true;
    });
  }

  prevImage() async {
    setState(() {
      _isImageDataReady = false;
    });
    if (spacex.links.flickr.original.length > 1) {
      _currentImageIndex = _currentImageIndex - 1;
      if (_currentImageIndex == -1) {
        _currentImageIndex = spacex.links.flickr.original.length - 1;
      }
      _imageData = Image.network(
        spacex.links.flickr.original[_currentImageIndex],
      );
      _imageData.image
          .resolve(ImageConfiguration())
          .addListener(ImageStreamListener((ImageInfo info, bool syncCall) {
        setState(() {
          _isImageDataReady = true;
        });
      }));
    }
  }

  nextImage() async {
    setState(() {
      _isImageDataReady = false;
    });
    if (spacex.links.flickr.original.length > 1) {
      _currentImageIndex = _currentImageIndex + 1;
      if (_currentImageIndex >= spacex.links.flickr.original.length) {
        _currentImageIndex = 0;
      }
      _imageData = Image.network(
        spacex.links.flickr.original[_currentImageIndex],
      );
      _imageData.image
          .resolve(ImageConfiguration())
          .addListener(ImageStreamListener((ImageInfo info, bool syncCall) {
        setState(() {
          _isImageDataReady = true;
        });
      }));
    }
  }

  bool _isImageDataReady = false;
  late Image _imageData;
  int _currentImageIndex = 0;
  bool _isInfoReady = false;
  late Spacex spacex;
  Styles customStyles = Styles();
}
