import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  VideoPlayerController playerController;
  VoidCallback listener;

  @override
  void initState() {
    super.initState();
    listener = () {
      setState(() {});
    };
  }

  void createVideo(url) {
    isplay = true;
    if (playerController == null) {
      playerController = VideoPlayerController.asset(url)
        ..addListener(listener)
        ..setVolume(1.0)
        ..initialize()
        ..play();
    } else {
      if (playerController.value.isPlaying) {
        playerController.pause();
      } else {
        playerController.initialize();
        playerController.play();
      }
    }
  }

  @override
  void deactivate() {
    isplay = false;
    playerController.pause();
    playerController.setVolume(0.0);
    playerController.removeListener(listener);
    super.deactivate();
  }

  void pause() {
    setState(() {
      isplay = false;
      playerController.pause();
      // playerController.setVolume(0.0);
    });
  }

  void play() {
    setState(() {
      isplay = true;
      playerController.pause();
      playerController.initialize();
      playerController.play();
    });
  }

  bool isplay = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              width: 35,
              height: 22,
              decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(6),
                  // color: Colors.red[400]),

              ),
              child: Image.asset(
               "images/iiec.jpg"

                // color: Colors.red,

                // color: Colors.red,
              ),
            ),
          ],
        ),
        title: Text(
          " IIEC - RISE",
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Oswald',
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.video_call, color: Colors.grey[600]),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(Icons.search, color: Colors.grey[600]),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.grey[600]),
            onPressed: null,
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
              child: Stack(
                children: [
                  Container(
                    child: (playerController != null
                        ? VideoPlayer(
                            playerController,
                          )
                        : Container()),
                    width: double.infinity,
                    height: double.infinity,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                    ),
                  ),
                  Center(
                    child: GestureDetector(
                      // onLongPress: deactivate,
                      onDoubleTap: play,
                      onTap: pause,

                      child: Container(
                        width: 35,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: isplay
                            ? Container()
                            : CircleAvatar(
                                backgroundColor: Colors.red[800],
                                radius: 60,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.play_arrow,
                                  ),
                                  iconSize: 20,
                                  onPressed: () {
                                    createVideo("videos/iiec.mp4");

                                    playerController.play();
                                  },

                                  // color: Colors.red,

                                  // color: Colors.red,
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              child: Stack(
                children: [
                  Container(
                    // child: (playerController != null
                    //     ? VideoPlayer(
                    //         playerController,
                    //       )
                    //     : Container()),
                    width: double.infinity,
                    height: double.infinity,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 35,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: isplay
                          ? Container()
                          : CircleAvatar(
                              backgroundColor: Colors.red[800],
                              radius: 60,
                              child: IconButton(
                                icon: Icon(
                                  Icons.play_arrow,
                                ),
                                iconSize: 20,
                                onPressed: () {
                                  // createVideo("videos/intro.mp4");

                                  // playerController.play();
                                },

                                // color: Colors.red,

                                // color: Colors.red,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              child: Stack(
                children: [
                  Container(
                    // child: (playerController != null
                    //     ? VideoPlayer(
                    //         playerController,
                    //       )
                    //     : Container()),
                    width: double.infinity,
                    height: double.infinity,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 35,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: isplay
                          ? Container()
                          : CircleAvatar(
                              backgroundColor: Colors.red[800],
                              radius: 60,
                              child: IconButton(
                                icon: Icon(
                                  Icons.play_arrow,
                                ),
                                iconSize: 20,
                                onPressed: () {
                                  // createVideo("videos/iiec.mp4");

                                  // playerController.play();
                                },

                                // color: Colors.red,

                                // color: Colors.red,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            height: 0,
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Icon(Icons.home, color: Colors.grey[600]),
                Icon(Icons.explore, color: Colors.grey[600]),
                Icon(Icons.subscriptions, color: Colors.grey[600]),
                Icon(Icons.notifications, color: Colors.grey[600]),
                Icon(Icons.video_library, color: Colors.grey[600]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
