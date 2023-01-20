
import 'package:flutter/material.dart';

class DateFormat extends StatelessWidget {

  const DateFormat(String s, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO.txt: implement build
    final DateTime now = DateTime.now();
    const DateFormat formatter = DateFormat('yyyy-MM-dd');
    //final String formatted = formatter.form
    print(now);
    //print(formatted);
    return Container();
  }
  }
