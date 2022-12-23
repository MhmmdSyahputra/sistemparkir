import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dart_vlc/dart_vlc.dart';
import 'package:screenshot/screenshot.dart';
import 'dart:typed_data';
import 'package:screenshot/screenshot.dart';

// // void main() async {
// //   DartVLC.initialize();
// //   runApp(DartVLCExample());
// // }

// class DartVLCExample extends StatelessWidget {
//   const DartVLCExample({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         // appBar: AppBar(
//         //   title: const Text('package:dart_vlc'),
//         //   centerTitle: true,
//         // ),
//         body: PrimaryScreen(),
//       ),
//     );
//   }
// }

// class PrimaryScreen extends StatefulWidget {
//   @override
//   PrimaryScreenState createState() => PrimaryScreenState();
// }
// // class PrimaryScreen extends StatefulWidget {
// //   @override
// //   final String title;
// //   @override
// //   _MyHomePageState createState() => _MyHomePageState();

// // }

// class PrimaryScreenState extends State<PrimaryScreen> {
//   ScreenshotController screenshotController = ScreenshotController();

//   Player player = Player(
//     id: 0,
//     videoDimensions: const VideoDimensions(640, 360),
//   );
//   MediaType mediaType = MediaType.network;
//   CurrentState current = CurrentState();
//   PositionState position = PositionState();
//   PlaybackState playback = PlaybackState();
//   GeneralState general = GeneralState();
//   VideoDimensions videoDimensions = const VideoDimensions(0, 0);
//   List<Media> medias = <Media>[
//     Media.network(
//         'rtsp://admin:admin123@192.168.2.201:554/cam/realmonitor?channel=1&subtype=1')
//   ];
//   // final network = Media.network('https://www.example.com/music.aac');
//   List<Device> devices = <Device>[];
//   TextEditingController controller = TextEditingController();
//   TextEditingController metasController = TextEditingController();
//   double bufferingProgress = 0.0;
//   Media? metadataCurrentMedia;

//   @override
//   void initState() {
//     super.initState();
//     if (mounted) {
//       player.currentStream.listen((value) {
//         setState(() => current = value);
//       });
//       player.positionStream.listen((value) {
//         setState(() => position = value);
//       });
//       player.playbackStream.listen((value) {
//         setState(() => playback = value);
//       });
//       player.generalStream.listen((value) {
//         setState(() => general = value);
//       });
//       player.videoDimensionsStream.listen((value) {
//         setState(() => videoDimensions = value);
//       });
//       player.bufferingProgressStream.listen(
//         (value) {
//           setState(() => bufferingProgress = value);
//         },
//       );
//       player.errorStream.listen((event) {
//         debugPrint('libVLC error.');
//       });
//       devices = Devices.all;
//       Equalizer equalizer = Equalizer.createMode(EqualizerMode.live);
//       equalizer.setPreAmp(10.0);
//       equalizer.setBandAmp(31.25, 10.0);
//       player.setEqualizer(equalizer);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     bool isTablet;
//     bool isPhone;
//     final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//     if (devicePixelRatio < 2 && (width >= 1000 || height >= 1000)) {
//       isTablet = true;
//       isPhone = false;
//     } else if (devicePixelRatio == 2 && (width >= 1920 || height >= 1920)) {
//       isTablet = true;
//       isPhone = false;
//     } else {
//       isTablet = false;
//       isPhone = true;
//     }
//     return ListView(
//       shrinkWrap: true,
//       // padding: const EdgeInsets.all(4.0),
//       children: [
//         Screenshot(
//           controller: screenshotController,
//           // mainAxisSize: MainAxisSize.min,
//           // mainAxisAlignment: MainAxisAlignment.center,
//           // crossAxisAlignment: CrossAxisAlignment.start,

//           child:
//             Card(
//               elevation: 4.0,
//               clipBehavior: Clip.antiAlias,
//               child: Video(
//                 player: player,
//                 width: isPhone ? 320 : 540,
//                 height: isPhone ? 180 : 360,
//                 volumeThumbColor: Colors.blue,
//                 volumeActiveColor: Colors.blue,
//                 showControls: !isPhone,
//               ),
//             )

//         ),
//         Row(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
// children: [
//   Expanded(
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         if (isPhone) _controls(context, isPhone),
//         Card(
//           elevation: 2.0,
//           margin: const EdgeInsets.all(4.0),
//           child: Container(
//             margin: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                     const Text('Playlist creation.'),
//                     const Divider(
//                       height: 8.0,
//                       color: Colors.transparent,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Expanded(
//                           child: TextField(
//                             controller: controller,
//                             autofocus: true,
//                             style: const TextStyle(
//                               fontSize: 14.0,
//                             ),
//                             decoration:
//                                 const InputDecoration.collapsed(
//                               hintStyle: TextStyle(
//                                 fontSize: 14.0,
//                               ),
//                               hintText: 'Enter Media path.',
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(left: 10.0),
//                           child: ElevatedButton(
//                             onPressed: () {
//                               medias.add(
//                                 Media.network(
//                                   controller.text,
//                                 ),
//                               );

//                               setState(() {});
//                             },
//                             child: const Text(
//                               'Add to Playlist',
//                               style: TextStyle(
//                                 fontSize: 14.0,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const Divider(
//                       height: 12.0,
//                     ),
//                     const Divider(
//                       height: 8.0,
//                       color: Colors.transparent,
//                     ),
//                     const Text('Playlist'),
//                   ] +
//                   medias
//                       .map(
//                         (media) => ListTile(
//                           title: Text(
//                             media.resource,
//                             style: const TextStyle(
//                               fontSize: 14.0,
//                             ),
//                           ),
//                           subtitle: Text(
//                             media.mediaType.toString(),
//                             style: const TextStyle(
//                               fontSize: 14.0,
//                             ),
//                           ),
//                         ),
//                       )
//                       .toList() +
//                   <Widget>[
//                     const Divider(
//                       height: 8.0,
//                       color: Colors.transparent,
//                     ),
//                     Row(
//                       children: [
//                         ElevatedButton(
//                           onPressed: () => setState(
//                             () {
//                               player.open(
//                                 Playlist(medias: medias),
//                               );
//                             },
//                           ),
//                           child: const Text(
//                             'Open into Player',
//                             style: TextStyle(
//                               fontSize: 14.0,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 12.0),
//                         ElevatedButton(
//                           onPressed: () {
//                             setState(() => medias.clear());
//                           },
//                           child: const Text(
//                             'Clear the list',
//                             style: TextStyle(
//                               fontSize: 14.0,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//             ),
//           ),
//         ),

//         // if (isPhone) _playlist(context),
//       ],
//     ),
//   ),
//   if (isTablet)
//     Expanded(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           _controls(context, isPhone),
//           // _playlist(context),
//         ],
//       ),
//     ),
// ],
//         ),

//         ElevatedButton(
//           child: const Text(
//             'Capture Above Widget',
//           ),
//           onPressed: () {
//             screenshotController
//                 .capture(delay: const Duration(milliseconds: 10))
//                 .then((capturedImage) async {
//               ShowCapturedWidget(context, capturedImage!);
//             }).catchError((onError) {
//               print(onError);
//             });
//           },
//         ),
//       ],
//     );

//   }

//   // ignore: non_constant_identifier_names
//   Future<dynamic> ShowCapturedWidget(
//       BuildContext context, Uint8List capturedImage) {
//     return showDialog(
//       useSafeArea: false,
//       context: context,
//       builder: (context) => Scaffold(
//         appBar: AppBar(
//           title: const Text("Captured widget screenshot"),
//         ),
//         body: Center(
//             // ignore: unnecessary_null_comparison
//             child: capturedImage != null
//                 ? Image.memory(capturedImage)
//                 : Container()),
//       ),
//     );
//   }

//   Widget _controls(BuildContext context, bool isPhone) {
//     return const Card(
//       elevation: 2.0,
//       margin: EdgeInsets.all(4.0),
//     );
//   }
// }

// ------------------------------------------------------------------------

// void main() async {
//   DartVLC.initialize();
//   runApp(DartVLCExample());
// }

class DartVLCExample extends StatelessWidget {
  const DartVLCExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Text('package:dart_vlc'),
        //   centerTitle: true,
        // ),
        body: PrimaryScreen(),
      ),
    );
  }
}

class PrimaryScreen extends StatefulWidget {
  @override
  PrimaryScreenState createState() => PrimaryScreenState();
}

class PrimaryScreenState extends State<PrimaryScreen> {
  ScreenshotController screenshotController = ScreenshotController();

  Player player = Player(
    id: 0,
    videoDimensions: const VideoDimensions(640, 360),
  );
  MediaType mediaType = MediaType.file;
  CurrentState current = CurrentState();
  PositionState position = PositionState();
  PlaybackState playback = PlaybackState();
  GeneralState general = GeneralState();
  VideoDimensions videoDimensions = VideoDimensions(0, 0);
  List<Media> medias = <Media>[];
  List<Device> devices = <Device>[];
  TextEditingController controller = TextEditingController();
  TextEditingController metasController = TextEditingController();
  double bufferingProgress = 0.0;
  Media? metadataCurrentMedia;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      player.currentStream.listen((value) {
        setState(() => current = value);
      });
      player.positionStream.listen((value) {
        setState(() => position = value);
      });
      player.playbackStream.listen((value) {
        setState(() => playback = value);
      });
      player.generalStream.listen((value) {
        setState(() => general = value);
      });
      player.videoDimensionsStream.listen((value) {
        setState(() => videoDimensions = value);
      });
      player.bufferingProgressStream.listen(
        (value) {
          setState(() => bufferingProgress = value);
        },
      );
      player.errorStream.listen((event) {
        debugPrint('libVLC error.');
      });
      devices = Devices.all;
      Equalizer equalizer = Equalizer.createMode(EqualizerMode.live);
      equalizer.setPreAmp(10.0);
      equalizer.setBandAmp(31.25, 10.0);
      player.setEqualizer(equalizer);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isTablet;
    bool isPhone;
    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    if (devicePixelRatio < 2 && (width >= 1000 || height >= 1000)) {
      isTablet = true;
      isPhone = false;
    } else if (devicePixelRatio == 2 && (width >= 1920 || height >= 1920)) {
      isTablet = true;
      isPhone = false;
    } else {
      isTablet = false;
      isPhone = true;
    }
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(4.0),
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Screenshot(
                controller: screenshotController,
                // mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,

                child: Card(
                  elevation: 4.0,
                  clipBehavior: Clip.antiAlias,
                  child: Video(
                    player: player,
                    width: isPhone ? 320 : 540,
                    height: isPhone ? 180 : 360,
                    volumeThumbColor: Colors.blue,
                    volumeActiveColor: Colors.blue,
                    showControls: !isPhone,
                  ),
                )),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isPhone) _controls(context, isPhone),
                  Card(
                    elevation: 2.0,
                    margin: const EdgeInsets.all(4.0),
                    child: Container(
                      margin: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                              const Text('Playlist creation.'),
                              const Divider(
                                height: 8.0,
                                color: Colors.transparent,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: controller,
                                      autofocus: true,
                                      style: const TextStyle(
                                        fontSize: 14.0,
                                      ),
                                      decoration:
                                          const InputDecoration.collapsed(
                                        hintStyle: TextStyle(
                                          fontSize: 14.0,
                                        ),
                                        hintText: 'Enter Media path.',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        medias.add(
                                          Media.network(
                                            controller.text,
                                          ),
                                        );

                                        setState(() {});
                                      },
                                      child: const Text(
                                        'Add to Playlist',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                height: 12.0,
                              ),
                              const Divider(
                                height: 8.0,
                                color: Colors.transparent,
                              ),
                              const Text('Playlist'),
                            ] +
                            medias
                                .map(
                                  (media) => ListTile(
                                    title: Text(
                                      media.resource,
                                      style: const TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    subtitle: Text(
                                      media.mediaType.toString(),
                                      style: const TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                )
                                .toList() +
                            <Widget>[
                              const Divider(
                                height: 8.0,
                                color: Colors.transparent,
                              ),
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () => setState(
                                      () {
                                        player.open(
                                          Playlist(medias: medias),
                                        );
                                      },
                                    ),
                                    child: const Text(
                                      'Open into Player',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12.0),
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() => medias.clear());
                                    },
                                    child: const Text(
                                      'Clear the list',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (isTablet)
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _controls(context, isPhone),
                  ],
                ),
              ),
          ],
        ),
            ElevatedButton(
              child: const Text(
                'Capture Above Widget',
              ),
              onPressed: () {
                screenshotController
                    .capture(delay: const Duration(milliseconds: 10))
                    .then((capturedImage) async {
                  ShowCapturedWidget(context, capturedImage!);
                }).catchError((onError) {
                  print(onError);
                });
              },
            ),
      ],
    );
  }

  Future<dynamic> ShowCapturedWidget(
      BuildContext context, Uint8List capturedImage) {
    return showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text("Captured widget screenshot"),
        ),
        body: Center(
            // ignore: unnecessary_null_comparison
            child: capturedImage != null
                ? Image.memory(capturedImage)
                : Container()),
      ),
    );
  }

  Widget _controls(BuildContext context, bool isPhone) {
    return const Card(
      elevation: 2.0,
      margin: EdgeInsets.all(4.0),
    );
  }
}
