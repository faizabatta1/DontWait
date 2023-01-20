import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dont_wait/Auth.dart';
import 'package:dont_wait/constants/UserType.dart';
import 'package:dont_wait/services/AuthChangeNotifier.dart';
import 'package:dont_wait/services/FirestoreService.dart';
import 'package:dont_wait/services/UserServices.dart';
import 'package:dont_wait/services/Utils.dart';
import 'package:dont_wait/services/centre.service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'date_format.dart';

class ChatScreen extends StatefulWidget {
  final String subscriber;
  final String publisher;
  final String subscriber_name;
  const ChatScreen({Key? key, required this.subscriber, required this.publisher, required this.subscriber_name}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController messageController = TextEditingController();
  FirebaseFirestore database = FirebaseFirestore.instance;
  FocusNode focusNode = FocusNode();

  Future pushMessage() async{
    UserType userType = Provider.of<AuthChangeNotifier>(context,listen: false).userType;
    final user = Provider.of<AuthChangeNotifier>(context,listen: false).userData;
    if(userType == UserType.NORMAL){
      await FirestoreService.pushMessage(
          publisher: widget.publisher,
          subscriber: widget.subscriber,
          content: messageController.text,
          subscriber_name:widget.subscriber_name,
          publisher_name:'${user['firstname']} ${user['lastname']}'
      );
    }else{
      await FirestoreService.pushMessage(
          publisher: widget.subscriber,
          subscriber: widget.publisher,
          content: messageController.text,
          subscriber_name:widget.subscriber_name,
          publisher_name: '${user['firstname']} ${user['lastname']}' //TODO.txt: CENTRE NAME
      );
    }

    messageController.text = "";
  }

  @override
  void initState() {
    super.initState();
    focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text(widget.subscriber_name),
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Expanded(
                flex: 1,
                child: StreamBuilder(
                  stream: FirestoreService.firestore.collection("messages").snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                    if(snapshot.hasData && !snapshot.hasError){
                      List<Widget> messagesWidgets = [];
                      final messages = snapshot.data!.docs.where((element){
                        return (element['publisher'] == widget.publisher && element['subscriber'] == widget.subscriber)
                            || (element['publisher'] == widget.subscriber && element['subscriber'] == widget.publisher);
                      }).toList();

                      messages.sort((a,b){
                        return a.get("timestamp").toString().compareTo(b['timestamp'].toString());
                      });

                      for(var message in messages){
                        final messageText = message.get("content");
                        final messageSender = message.get("publisher");
                        final messageStamp = DateTime.fromMillisecondsSinceEpoch(message.get("timestamp"));
                        UserType userType = Provider.of<AuthChangeNotifier>(context,listen: false).userType; // responsible for siding
                        if(userType == UserType.NORMAL){
                          if(messageSender == widget.publisher){
                            messagesWidgets.add(
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxWidth: MediaQuery.of(context).size.width * 0.80,
                                    ),
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                        ),
                                      ],
                                    ),
                                    child: Text(
                                      "$messageStamp - $messageText",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),

                            );
                          }else{
                            messagesWidgets.add(
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  constraints: BoxConstraints(
                                    maxWidth: MediaQuery.of(context).size.width * 0.80,
                                  ),
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    "$messageText - $messageStamp",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),


                                // Container(
                                //   alignment: Alignment.centerLeft,
                                //   child: Text(,
                                //     style: TextStyle(fontSize: 16),),
                                //   margin: EdgeInsets.symmetric(horizontal: 5 ,vertical: 4),
                                // )
                            );
                          }
                        }else if(userType == UserType.CENTRE){
                          if(messageSender == widget.publisher){
                            messagesWidgets.add(
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxWidth: MediaQuery.of(context).size.width * 0.80,
                                    ),
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                        ),
                                      ],
                                    ),
                                    child: Text(
                                      "$messageText - $messageStamp",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),

                                // Container(
                                //   margin: EdgeInsets.symmetric(horizontal: 5,vertical: 4),
                                //   alignment: Alignment.centerLeft,
                                //   child: Text("$messageText - $messageStamp",
                                //       style: TextStyle(fontSize: 16)),
                                // )
                            );
                          }else{
                            messagesWidgets.add(
                              Container(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  constraints: BoxConstraints(
                                    maxWidth: MediaQuery.of(context).size.width * 0.80,
                                  ),
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    "$messageStamp + $messageText",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                                // Container(
                                //   alignment: Alignment.centerRight,
                                //   child: Text("$messageStamp + $messageText",
                                //     style: TextStyle(fontSize: 16),),
                                //   margin: EdgeInsets.symmetric(horizontal: 5 ,vertical: 4),
                                // )
                            );
                          }
                        }

                      }
                      return ListView(
                        children: messagesWidgets,
                      );
                    }else{
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      focusNode: focusNode,
                      decoration: InputDecoration(
                        border: OutlineInputBorder()
                      ),
                    ),
                    flex: 1,
                  ),
                  ElevatedButton(
                      onPressed: ()async{
                        if(messageController.text != "") {
                          await pushMessage();
                        } else{
                          Utils.showSnackbar(context: context, message: "please enter something");
                        }
                        // messagesStreaming();
                      },
                      child: Icon(Icons.send,color: Colors.white,)
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
