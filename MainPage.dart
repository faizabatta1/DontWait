import 'package:flutter/material.dart';
class MainPage extends StatefulWidget {
const MainPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}
class _MainPageState extends State<MainPage>{

  @override
  Widget build(BuildContext context)  => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.teal,
      title: const Text('',
        style: TextStyle(
        fontSize:16,
        fontFamily: 'ultra')),
      leading: IconButton(
        icon :const Icon(Icons.menu)  ,
        onPressed: (){},

      ),
      actions: [
        IconButton(
          icon :const Icon(Icons.search)  ,
          onPressed: (){},

        ),
        IconButton(
          icon :const Icon(Icons.notifications_active)  ,
          onPressed: (){},

        )

      ],

    ),













  );






}



