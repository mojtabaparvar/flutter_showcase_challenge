import 'package:flutter/material.dart';
import 'package:show_case_challenge/categories/screen/categories.dart';
import 'package:show_case_challenge/home/screen/home.dart';
import 'package:show_case_challenge/profile/screen/profile.dart';
import 'package:show_case_challenge/settings/screen/settings.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> pages = [
    HomeScreen(),
    CategoriesScreen(),
    ProfileScreen(),
    SettingsScreen()
  ];
  int _chosenPage = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        child: Container(
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 40,
          ),
          margin: EdgeInsetsDirectional.only(bottom: 15),
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.cyan,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          pages[_chosenPage],
          Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: size.width,
                height: 80,
                child: Stack(
                  children: [
                    CustomPaint(
                      size: Size(size.width, 80),
                      painter: CurvyShapePainter(),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        width: size.width,
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(Icons.home,
                                  color: _chosenPage == 0
                                      ? Colors.cyan
                                      : Colors.white),
                              onPressed: () {
                                setState(() {
                                  _chosenPage = 0;
                                });
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.category_outlined,
                                  color: _chosenPage == 1
                                      ? Colors.cyan
                                      : Colors.white),
                              onPressed: () {
                                setState(() {
                                  _chosenPage = 1;
                                });
                              },
                            ),
                            SizedBox(),
                            IconButton(
                              icon: Icon(Icons.person_outline,
                                  color: _chosenPage == 2
                                      ? Colors.cyan
                                      : Colors.white),
                              onPressed: () {
                                setState(() {
                                  _chosenPage = 2;
                                });
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.settings_outlined,
                                  color: _chosenPage == 3
                                      ? Colors.cyan
                                      : Colors.white),
                              onPressed: () {
                                setState(() {
                                  _chosenPage = 3;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class CurvyShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white10
      ..style = PaintingStyle.fill;
    Path path = Path();
    path.moveTo(0, 20);
    path.quadraticBezierTo(size.width * 0.2, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.4, 0, size.width * 0.4, 20);
    path.arcToPoint(Offset(size.width * 0.6, 20),
        radius: Radius.circular(10), clockwise: false);
    path.quadraticBezierTo(size.width * 0.6, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.8, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
