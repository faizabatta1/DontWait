import 'package:flutter/material.dart';

class background extends StatelessWidget {
final Widget child;
const background({
Key? key,
required this.child,
}) : super(key: key);

@override
Widget build(BuildContext context) {
Size size = MediaQuery.of(context).size;

return SizedBox(
height: size.height,
width: double.infinity,
child: Stack(
alignment: Alignment.center,
children: <Widget> [
// Positioned(
// top: 0,
// left: 0,
// child: Image.asset(
// "assets/image/top.png",
// width: size.width * 0.3,
// ),
// ),

child,
],
),
);
}
}