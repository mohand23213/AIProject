import 'dart:math';

import 'package:flutter/material.dart';
import 'DFS.dart';
class mainPage extends StatefulWidget {
  const mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    double gamePlayWidth=size.width*0.75;
    MissionariesAndCannibals game=MissionariesAndCannibals();
    game.findSolutonByDFS();
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.red,Colors.blue])),
        child: Column(
          children: [
            SizedBox(height: 25,),
            Text('Missionaries and Cannibals',style: TextStyle(fontSize: 25,color: Colors.white),),
            SizedBox(height: size.height/5,),
            ClipPath(
              clipper: StarClipper(),
              child: Container(color: Colors.blue,height:200,width:gamePlayWidth,child: Text('mohand'),),
            ),
          ],
        ),
      ),
    );
  }
}
class StarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    print(1);
    final path = Path();
    path.moveTo(0, size.height/2);
    path.lineTo(size.width, size.height/2);
    path.lineTo(size.width, 0);
    for(int i=1;i<10;i++){
      path.quadraticBezierTo(size.width-10*i, 20, size.width-10*(i+1), 0);
    }
    path.close();

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
