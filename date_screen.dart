
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';


class DateScreen extends StatelessWidget {

  const DateScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final format =DateFormat('yyyy-MM-dd');
    return Scaffold(
    //  debugShowCheckedModeBanner: false,
     // theme: ThemeData(primarySwatch: Colors.teal),

        appBar: AppBar(
          title:  const Text("Date Field"),
          centerTitle: true,
        ),
        body: Container(
          child: Padding(
          padding: const EdgeInsets.all(16.0),
            child:  DateTimeField(format: format,
                decoration: const InputDecoration(
                  labelText: 'Choose Date'
                ),

                onShowPicker:(
                context, currentValue) async{
              final date = showDatePicker(context: context, initialDate: currentValue ?? DateTime.now(),
                  firstDate: DateTime(2022), lastDate: DateTime(2025));
              return date;



            })),


        ),
    );
}
}



