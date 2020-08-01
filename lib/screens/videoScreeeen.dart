import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_clone/components/iconContainer.dart';
import 'package:youtube_clone/models/videoDetails.dart';

class VideoScreen extends StatefulWidget {
  final VideoDetails video;
  VideoScreen({this.video});

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  //VideoPlayerController controller;
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    //super.initState();
    try {
      print('Video url: ' + widget.video.videoUrl);
      _controller = VideoPlayerController.asset(widget.video.videoUrl);
      _initializeVideoPlayerFuture =
          _controller.initialize.then((value) => _controller.play());
      super.initState();
      // ..initialize.then((_) {
      //   //controller.play();
      //   // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
      //   // setState(() {
      //   //   controller.play();
      //   // });
      // });
    } catch (e) {}
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    //VideoPlayerController controller;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                FutureBuilder(
                    future: _initializeVideoPlayerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller));
                      } else {
                        return Container(
                            // padding: EdgeInsets.symmetric(vertical: height*0.1,horizontal: width*0.4),
                            // child: CircularProgressIndicator()
                            );
                      }
                    }),
                // controller.value.initialized
                // ? AspectRatio(
                //     aspectRatio: controller.value.aspectRatio,
                //     child: VideoPlayer(controller),
                //       )
                //     : Container(),
                Positioned(
                    top: height * 0.1,
                    left: width * 0.15,
                    child: VideoController(controller: _controller)),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              margin: EdgeInsets.only(top: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.video.videoName,
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    widget.video.views + ' views . ' + widget.video.age,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      BottomBarIcons(
                        icon: Icons.thumb_up,
                        iconColor: Colors.grey,
                        iconName: '50K',
                      ),
                      BottomBarIcons(
                        icon: Icons.thumb_down,
                        iconColor: Colors.grey,
                        iconName: '2K',
                      ),
                      BottomBarIcons(
                        icon: Icons.redo,
                        iconColor: Colors.grey,
                        iconName: 'Share',
                      ),
                      BottomBarIcons(
                        icon: Icons.file_download,
                        iconColor: Colors.grey,
                        iconName: 'Download',
                      ),
                      BottomBarIcons(
                        icon: Icons.save_alt,
                        iconColor: Colors.grey,
                        iconName: 'Save',
                      ),
                    ],
                  ),
                  //SizedBox(height: 15.0),
                ],
              ),
            ),
            Divider(
              thickness: 2.0,
              height: 30.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  CircleAvatar(
                      backgroundImage: AssetImage(widget.video.channelLogoUrl)),
                  Text(
                    widget.video.channelName,
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    'SUBSCRIBED',
                    style: TextStyle(fontSize: 20.0, color: Colors.grey),
                  ),
                  Icon(
                    Icons.notifications_none,
                    color: Colors.grey,
                    size: 40.0,
                  )
                ],
              ),
            ),
            Divider(
              thickness: 2.0,
              height: 30.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Coments  47',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/person.png'),
                        radius: 12.0,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Nice Video',
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/person.png'),
                        radius: 12.0,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Awesome content !!',
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class VideoController extends StatefulWidget {
  const VideoController({
    Key key,
    @required this.controller,
  }) : super(key: key);

  final VideoPlayerController controller;

  @override
  _VideoControllerState createState() => _VideoControllerState();
}

class _VideoControllerState extends State<VideoController> {
  Color iconColor = Colors.white;
  IconData play = Icons.play_arrow;
  IconData pause = Icons.pause;
  IconData current = Icons.pause;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
            icon: Icon(
              Icons.skip_previous,
              color: iconColor,
              size: 60.0,
            ),
            onPressed: () {}),
        SizedBox(
          width: 60.0,
        ),
        IconButton(
          onPressed: () {
            setState(() {
              if (widget.controller.value.isPlaying) {
                widget.controller.pause();
                current = play;
              } else {
                widget.controller.play();
                current =pause ;
              }
              // widget.controller.value.isPlaying
              //     ? widget.controller.pause()

              //     : widget.controller.play();

              // Timer(Duration(seconds: 2), () {
              //   iconColor =iconColor==Colors.white? Colors.white10:Colors.white;
              // });
            });
          },
          icon: Icon(
            current,
            //widget.controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
            color: iconColor,
            size: 60.0,
          ),
        ),
        SizedBox(
          width: 60.0,
        ),
        IconButton(
            icon: Icon(
              Icons.skip_next,
              color: iconColor,
              size: 60.0,
            ),
            onPressed: null),
      ],
    );
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   widget.controller.dispose();
  // }
}
