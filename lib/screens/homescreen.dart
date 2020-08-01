import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_clone/components/categoryListTile.dart';
import 'package:youtube_clone/components/iconContainer.dart';
import 'package:youtube_clone/models/categories.dart';
import 'package:youtube_clone/models/videoDetails.dart';
import 'package:youtube_clone/screens/videoScreeeen.dart';

int tappedIndex = 0;

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Color categoryListTileActiveColor = Colors.white;
    Color categoryListTileINActiveColor = Colors.grey[800];

    Size size = MediaQuery.of(context).size;
    print('Root size: '+MediaQuery.of(context).size.toString());
    double height = size.height;
    double width = size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
              child: Container(
                color: Colors.grey[600],
                height: 0.5,
              ),
              preferredSize: Size.fromHeight(0.5)),
          backgroundColor: Colors.grey[850],
          leading: Padding(
              padding: EdgeInsets.only(
                  bottom: 10.0, top: 10.0, left: 10.0, right: 0.0),
              child: FaIcon(
                FontAwesomeIcons.youtube,
                color: Colors.red,
                size: 30.0,
              )),
          titleSpacing: -10.0,
          title: Text('YouTube', style: GoogleFonts.anton(fontSize: 20.0)),
          actions: <Widget>[
            Icon(
              Icons.videocam,
              size: 25.0,
            ),
            SizedBox(
              width: 20.0,
            ),
            Icon(
              Icons.search,
              size: 25.0,
            ),
            SizedBox(
              width: 20.0,
            ),
            CircleAvatar(
              backgroundColor: Colors.grey,
              // backgroundImage:  AssetImage('assets/images/person.png'),
              radius: 15.0,
              child: Icon(
                Icons.person,
                size: 30.0,
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            Flexible(
                flex: 1,
                child: Container(
                //print('topbar size: '+MediaQuery.of(context).size.toString()),
                margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
                padding: EdgeInsets.only(bottom: 7.0),
                width: width,
                //height: height * 0.07,
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 4.0, color: Colors.black38)),
                ),
                //color: Colors.amberAccent,
                child: ListView.builder(
                    itemCount: categories.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            tappedIndex = index;
                          });
                        },
                        child: tappedIndex == index
                            ? CategoryListTile(
                                width: width,
                                index: index,
                                color: categoryListTileActiveColor,
                                textColor: Colors.black,
                              )
                            : CategoryListTile(
                                width: width,
                                index: index,
                                color: categoryListTileINActiveColor,
                                textColor: Colors.white,
                              ),
                      );
                    }),
              ),
            ),
            Flexible(
                flex: 9,
                child: Container(
                width: width,
                //height: height * 0.725,
                color: Colors.black26,
                child: ListView.builder(
                    itemCount: videos.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 20.0),
                        child: (Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => VideoScreen(
                                            video: videos[index],
                                          ))),
                              child: Image.asset(
                                videos[index].imageUrl,
                                width: width,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: width * 0.07, top: 15.0),
                              child: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage(videos[index].channelLogoUrl),
                                    radius: 18.0,
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        videos[index].videoName,
                                        style: TextStyle(fontSize: 18.0),
                                      ),
                                      SizedBox(
                                        height: 6.0,
                                      ),
                                      Text(
                                        videos[index].channelName +
                                            ' . ' +
                                            videos[index].views +
                                            ' . ' +
                                            videos[index].age,
                                        style: TextStyle(color: Colors.grey),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: width * 0.25,
                                  ),
                                  Icon(
                                    Icons.more_vert,
                                    color: Colors.grey,
                                    size: 20.0,
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
                      );
                    }),
              ),
            ),
            BottomBar(width: width, height: height)
          ],
        ),
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key key,
    @required this.width,
    @required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Flexible(
          flex: 1,
        child: Container(
        width: width,
        //height: height * 0.07,
        //color: Colors.amber,
        padding: EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            BottomBarIcons(
              icon: Icons.home,
              iconName: 'Home',
              iconColor: Colors.white,
            ),
            BottomBarIcons(
              icon: Icons.explore,
              iconName: 'Explore',
              iconColor: Colors.grey,
            ),
            BottomBarIcons(
              icon: Icons.subscriptions,
              iconName: 'Subscriptions',
              iconColor: Colors.grey,
            ),
            BottomBarIcons(
              icon: Icons.email,
              iconName: 'Inbox',
              iconColor: Colors.grey,
            ),
            BottomBarIcons(
              icon: Icons.video_library,
              iconName: 'Library',
              iconColor: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
