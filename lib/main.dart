import 'package:flutter/material.dart';
import 'package:rtsp_demo/screen/liveScreen.dart';
import 'package:rtsp_demo/screen/capture.dart';
// import 'package:sistem_parkir/screen/liveScreen.dart';
import 'package:dart_vlc/dart_vlc.dart';

main() async {
  DartVLC.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Text("Navbar")
        // ),
        body: Column(children: [
          Row(
            children: [
              Container(
                color: Colors.grey[100],
                height: 372,
                width: 683,
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 20, right: 20),
                child: const Text(
                  "PICTURE IN DATABASE",
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
              ),
              Container(
                  color: Colors.grey[200],
                  height: 372,
                  width: 683,
                  // padding: const EdgeInsets.only(top:20,bottom:20,left:20,right:20),
                  // child: const DartVLCExample(),
                  child: ListView(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 372,
                            width: 683,
                            child: const DartVLCExample(),
                          ),
                      ],
                      ),
                      // Row(
                      //   children: [
                      //     Container(
                      //       height: 372,
                      //       width: 683,
                      //       child: MyHomePage(title: ''),
                      //     ),
                      // ],
                      // ),
                    ],
                  )                   
                  ),
            ],
          ),
          Row(
            children: [
              Container(
                color: Colors.cyan[100],
                height: 372,
                width: 683,
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 20, right: 20),
                child: const Text(
                  "DATA",
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
              ),
              Container(
                color: Colors.cyan[200],
                height: 372,
                width: 683,
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 20, right: 20),
                child: ListView(children: [
                  Row(
                    children: [
                      Container(
                        color: Colors.cyan[100],
                        margin: const EdgeInsets.only(top: 7, bottom: 7),
                        child: const Text(
                          "Biaya Parkir",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      Container(
                        color: Colors.cyan[100],
                        margin: const EdgeInsets.only(top: 7, bottom: 7),
                        child: const Text(
                          "Rp. 7000",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      Container(
                        color: Colors.cyan[100],
                        margin: const EdgeInsets.only(top: 7, bottom: 7),
                        child: const Text(
                          "Rp. 7000",
                          style: TextStyle(fontSize: 30),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        color: Colors.cyan[100],
                        height: 50,
                        width: 300,
                        margin: const EdgeInsets.only(top: 7, bottom: 7),
                        child: const Text(
                          "Biaya Parkir",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      Container(
                        color: Colors.cyan[100],
                        height: 50,
                        width: 300,
                        margin: const EdgeInsets.only(top: 7, bottom: 7),
                        child: const Text(
                          "Rp. 7000",
                          style: TextStyle(fontSize: 30),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        color: Colors.cyan[100],
                        height: 50,
                        width: 300,
                        margin: const EdgeInsets.only(top: 7, bottom: 7),
                        child: const Text(
                          "Biaya Parkir",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      Container(
                        color: Colors.cyan[100],
                        height: 50,
                        width: 300,
                        margin: const EdgeInsets.only(top: 7, bottom: 7),
                        child: const Text(
                          "Rp. 7000",
                          style: TextStyle(fontSize: 30),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        color: Colors.cyan[100],
                        height: 50,
                        width: 300,
                        margin: const EdgeInsets.only(top: 7, bottom: 7),
                        child: const Text(
                          "Biaya Parkir",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      Container(
                        color: Colors.cyan[100],
                        height: 50,
                        width: 300,
                        margin: const EdgeInsets.only(top: 7, bottom: 7),
                        child: const Text(
                          "Rp. 7000",
                          style: TextStyle(fontSize: 30),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        color: Colors.cyan[100],
                        height: 50,
                        width: 300,
                        margin: const EdgeInsets.only(top: 7, bottom: 7),
                        child: const Text(
                          "Biaya Parkir",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      Container(
                        color: Colors.cyan[100],
                        height: 50,
                        width: 300,
                        margin: const EdgeInsets.only(top: 7, bottom: 7),
                        child: const Text(
                          "Rp. 7000",
                          style: TextStyle(fontSize: 30),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        color: Colors.cyan[100],
                        height: 50,
                        width: 300,
                        margin: const EdgeInsets.only(top: 7, bottom: 7),
                        child: const Text(
                          "Biaya Parkir",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      Container(
                        color: Colors.cyan[100],
                        height: 50,
                        width: 300,
                        margin: const EdgeInsets.only(top: 7, bottom: 7),
                        child: const Text(
                          "Rp. 7000",
                          style: TextStyle(fontSize: 30),
                        ),
                      )
                    ],
                  ),
                ]),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
