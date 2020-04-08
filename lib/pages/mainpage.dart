import 'package:flutter/material.dart';
import 'package:flutter_ui_three/constants/constants.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> profileZoomAnimation;
  Animation<double> iconZoomAnimation;
  Animation<Offset> menuBarAnimation;
  Animation<Offset> titleAnimation;
  Animation<Offset> searchBarAnimation;
  Animation<Offset> textRowAnimation;
  Animation<Offset> placeAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        new AnimationController(vsync: this, duration: Duration(seconds: 1));

    profileZoomAnimation = new Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.fastOutSlowIn,
      ),
    );

    menuBarAnimation = new Tween<Offset>(
      begin: Offset(2, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.1,
          1.0,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    titleAnimation =
        new Tween<Offset>(begin: Offset(3, 0), end: Offset.zero).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.15,
          1.0,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    textRowAnimation = new Tween<Offset>(
      begin: Offset(2, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.3,
          1.0,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    searchBarAnimation = new Tween<Offset>(
      begin: Offset(0, -5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.2,
          1.0,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    iconZoomAnimation = new Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(
        0.3,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    ));

    placeAnimation = new Tween<Offset>(
      begin: Offset(2, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.4,
          1.0,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: 30,
                left: 15,
                right: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ScaleTransition(
                    scale: profileZoomAnimation,
                    child: CircleAvatar(
                      backgroundColor: purple,
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                    ),
                  ),
                  SlideTransition(
                    position: menuBarAnimation,
                    child: Icon(
                      Icons.menu,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: SlideTransition(
                position: titleAnimation,
                child: Text(
                  'Discover \nthe World',
                  style: TextStyle(
                    fontFamily: yOne,
                    fontSize: 40.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SlideTransition(
              position: searchBarAnimation,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  height: 70,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Search something',
                            style: TextStyle(
                              fontFamily: mMed,
                              fontSize: 15,
                              color: Colors.grey[500],
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: lightPurple,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  IconWidget(
                    icon: Icon(
                      Icons.airplanemode_active,
                      color: Colors.white,
                      size: 35,
                    ),
                    color: purple,
                    zoomAnimation: iconZoomAnimation,
                  ),
                  IconWidget(
                    icon: Icon(
                      Icons.camera_alt,
                      color: purple,
                      size: 35,
                    ),
                    color: lightPurple,
                    zoomAnimation: iconZoomAnimation,
                  ),
                  IconWidget(
                    icon: Icon(
                      Icons.directions_car,
                      color: purple,
                      size: 35,
                    ),
                    color: lightPurple,
                    zoomAnimation: iconZoomAnimation,
                  ),
                  IconWidget(
                    icon: Icon(
                      Icons.business,
                      color: purple,
                      size: 35,
                    ),
                    color: lightPurple,
                    zoomAnimation: iconZoomAnimation,
                  ),
                  IconWidget(
                    icon: Icon(
                      Icons.directions,
                      color: purple,
                      size: 35,
                    ),
                    color: lightPurple,
                    zoomAnimation: iconZoomAnimation,
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: SlideTransition(
                position: textRowAnimation,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    SizedBox(
                      width: 30,
                    ),
                    Center(
                      child: Text(
                        'New',
                        style: TextStyle(
                          fontFamily: mReg,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Center(
                      child: Text(
                        'Most Viewed',
                        style: TextStyle(
                          fontFamily: mReg,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Center(
                      child: Text(
                        'Hot tours',
                        style: TextStyle(
                          fontFamily: mReg,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Center(
                      child: Text(
                        'All',
                        style: TextStyle(
                          fontFamily: mReg,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 400,
              width: double.infinity,
              child: SlideTransition(
                position: placeAnimation,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    PlaceWidget(
                      placeName: 'Slopes',
                      where: 'Russia',
                      img: 'russia',
                    ),
                    PlaceWidget(
                      placeName: 'Forest',
                      where: 'Hawaii',
                      img: 'hawaii',
                    ),
                    PlaceWidget(
                      placeName: 'Colloseum',
                      where: 'Greece',
                      img: 'greece',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PlaceWidget extends StatelessWidget {
  final String placeName;
  final String where;
  final String img;

  PlaceWidget({this.placeName, this.where, this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 250,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(
          image: AssetImage('assets/images/$img.jpg'),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(bottom: 10, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: SizedBox(),
            ),
            Text(
              placeName,
              style: TextStyle(
                fontFamily: mMed,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.location_on,
                  color: Colors.redAccent[100],
                ),
                Text(
                  where,
                  style: TextStyle(
                    fontFamily: mMed,
                    color: Colors.redAccent[100],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class IconWidget extends StatelessWidget {
  final Icon icon;
  final Color color;
  final Animation<double> zoomAnimation;

  IconWidget({this.icon, this.color, this.zoomAnimation});

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: zoomAnimation,
      child: Container(
        width: 80,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: icon,
        ),
      ),
    );
  }
}
