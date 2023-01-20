import 'package:dont_wait/services/centre.service.dart';
import 'package:dont_wait/table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Signup/ThemeHelper.dart';

class ReportResult extends StatefulWidget {
  final Map test;
  const ReportResult({Key? key, required this.test}) : super(key: key);

  @override
  State<ReportResult> createState() => _ReportResultState();
}

class _ReportResultState extends State<ReportResult> {
  FocusNode focusNode = FocusNode();
  TextEditingController resultController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: GestureDetector(
        onTap: (){
          focusNode.unfocus();
        },
        child: Center(
          child: Container(
            margin: EdgeInsets.all(16.0),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(

                  focusNode: focusNode,
                  controller: resultController,
                  maxLines: 10,
                  decoration: InputDecoration(

                      border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(10)
                      ),
                      hintText: "write patient test result",
                      label: Text("result",style:TextStyle(
                        fontSize: 15,
                        fontFamily: 'ultra',
                        color: Colors.teal,

                      ),)
                  ),
                ),
                SizedBox(height: 20,),
                ElevatedButton(
             style: ThemeHelper().buttonStyle(),
                  onPressed: ()async{
                    await pushReport(
                        patient_name: widget.test['patient_name'],
                        centre_name:widget.test['centre_name'],
                        test_type: widget.test['test'],
                        result: resultController.text,
                        date:widget.test['date'],
                        patient_id:widget.test['patientId'],
                        status: 'done'
                    ).then((value) async{
                      await deleteAppointment(id: widget.test['id'].toString()).then((value){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => table()));
                      });
                    });
                  },
                  child: Text('submit',style:TextStyle(
                    fontSize: 13,
                    fontFamily: 'ultra',
                    color: Colors.white,

                  ),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
