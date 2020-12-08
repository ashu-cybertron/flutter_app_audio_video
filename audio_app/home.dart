import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final spinkit = SpinKitWave(
    color: Colors.white,
    size: 100.0,
    // controller: AnimationController( duration: const Duration(milliseconds: 1200)),
  );

  AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Jonas Blue"),
      // backgroundColor: Colors.black,
      // centerTitle: true,),
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(1),
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("images/background.jpg")),
            ),
          ),
          Container(child: isPlaying ? spinkit : Container()),
          Align(
            alignment: Alignment.bottomCenter,

            child: Container(
              // color: Colors.transparent,
              width: 300,
              height: 60,

              margin: EdgeInsets.only(bottom: 100),

              child: Card(
                elevation: 0,
                color: Colors.transparent,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(
                            Icons.skip_previous,
                            size: 40,
                          ),
                          color: Colors.white,
                          onPressed: () async {
                            String filePath = await FilePicker.getFilePath();

                            int status = await _audioPlayer.play(filePath,
                                isLocal: true);

                            if (status == 1) {
                              setState(() {
                                isPlaying = true;
                              });
                            }
                          }),
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: IconButton(
                          iconSize: 30,
                          color: Colors.white,
                          icon:
                              Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                          onPressed: () {
                            if (isPlaying) {
                              _audioPlayer.pause();

                              setState(() {
                                isPlaying = false;
                              });
                            } else {
                              _audioPlayer.resume();

                              setState(() {
                                isPlaying = true;
                              });
                            }
                          },
                        ),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.skip_next,
                            size: 40,
                          ),
                          color: Colors.white,
                          onPressed: () async {
                            String filePath = await FilePicker.getFilePath();

                            int status = await _audioPlayer.play(filePath,
                                isLocal: true);

                            if (status == 1) {
                              setState(() {
                                isPlaying = true;
                              });
                            }
                          }),
                    ]),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            // SizedBox(
            //   height: 300,
            // ),
          ),
        ],
      ),
      floatingActionButton: GestureDetector(
        child: FloatingActionButton(
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          child: Icon(
            Icons.audiotrack,
            color: Colors.red[900],
          ),
          onPressed: () async {
            String filePath = await FilePicker.getFilePath();

            int status = await _audioPlayer.play(filePath, isLocal: true);

            if (status == 1) {
              setState(() {
                isPlaying = true;
              });
            }
          },
        ),
      ),
    );
  }
}
