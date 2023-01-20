import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
List<Color> _colors = [Colors.teal, Colors.white, Colors.teal];

class Report extends StatelessWidget {
  final Map<String,dynamic> reportData;

  const Report({Key? key,required this.reportData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("patient test report",style:TextStyle(
          fontSize: 20,
          fontFamily: 'ultra',
          color: Colors.white,

        ),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [

                  const SizedBox(height: 20,),

                  Container(
                    alignment: Alignment.center,

                    height: 600,
                    decoration:  BoxDecoration(

                      color: Colors.teal,
                      boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10, spreadRadius: 5)],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children:  <Widget>[
                        SizedBox(height: 100,
                          child: Card(

                            borderOnForeground: true,
                            shadowColor: Colors.teal,
                            elevation: 7,
                            child: ListTile(
                              enabled: true,
                              hoverColor: Colors.teal,
                              selectedTileColor: Colors.cyan,
                              horizontalTitleGap: 6.0,
                              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                               title: Text( "Hello ${reportData['patient_name']} \n This is your ${reportData['test_type']}  result",style:TextStyle(
                                fontSize: 15,
                                fontFamily: 'ultra',
                                color: Colors.black,

                              ),textAlign: TextAlign.center,),
                            ),

                          ),
                        ),
                        SizedBox(height: 60,
                          child: Card(

                            borderOnForeground: true,
                            shadowColor: Colors.teal,
                            elevation: 7,
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                              title: Text( " Date : ${reportData['date']} \n"
                                  "done in ${reportData['centre_name']}",style:TextStyle(
                                fontSize: 10,
                                fontFamily: 'ultra',
                                color: Colors.black,

                              ),textAlign: TextAlign.center,),
                            ),

                          ),
                        ),
                        SizedBox(height: 7,),
                        SizedBox(height: 400,
                            child: Card(
                              borderOnForeground: true,
                              shadowColor: Colors.teal,
                              elevation: 7,
                              child: ListTile(
                                horizontalTitleGap: 6.0,

                                title:
                                Text( "${reportData['result']}",style: TextStyle(fontWeight: FontWeight.normal,
                                    fontStyle: FontStyle.italic, fontSize: 18,fontFamily: 'ultra' ,color: Colors.black)),

                              ),
                            ))


                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}
