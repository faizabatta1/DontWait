
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dont_wait/Book.dart';
import 'package:dont_wait/centreBranches.dart';
import 'package:dont_wait/services/AuthChangeNotifier.dart';
import 'package:dont_wait/services/Authentication.dart';
import 'package:dont_wait/services/FirestoreService.dart';
import 'package:dont_wait/services/UserServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dont_wait/login_page.dart';
import 'package:dont_wait/splash_screen.dart';
import 'package:dont_wait/header_widget.dart';
import 'package:dont_wait/components/forgot_password_verification_page.dart';
import 'package:dont_wait/forgot_password_page.dart';

import 'package:dont_wait/Signup/registration_page.dart';
import 'package:geolocator/geolocator.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:provider/provider.dart';

import 'ChatScreen.dart';
import 'Signup/ThemeHelper.dart';
import 'components/appDrawer.dart';
import 'home_screen.dart';

/*
*
*
*
* import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CentreProfile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(centre['placename']),
            Text(centre['email']),
            Text("${centre['phone']}"),
            Text(centre['medicalTests']),
            Text(centre['branches']),
          ],
        ),
      ),
    );
  }
}

* */

class CentreProfile extends StatelessWidget{
  final Map<dynamic,dynamic> centre;
  final double  _drawerIconSize = 24;
  final double _drawerFontSize = 17;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  CentreProfile({required this.centre});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,

      floatingActionButton: FloatingActionButton(
        /*
        * user and centre both have uid
        * collection rooms will have identifier as publisherUid-subscriberUid and not bi-directional
        * */
        onPressed: ()async {
          String publisher = Provider.of<AuthChangeNotifier>(context,listen: false).userData['id'];

          Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext context){
                return ChatScreen(
                    subscriber:centre['id'],
                    publisher: publisher,
                    subscriber_name:centre['placename']
                );
                return HomeScreen();
              })
          );
        },
        child: Icon(Icons.message,color: Colors.white,),
        backgroundColor: Colors.blueAccent,
      ),

      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('',
            style: TextStyle(
                fontSize:16,
                fontFamily: 'ultra')),


        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => HomeScreen()));
          },
        ),

        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace:Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Theme.of(context).primaryColor, Theme.of(context).colorScheme.secondary,]
              )
          ),
        ),
        actions: [
          IconButton(
            onPressed: ()async{
              Map location = jsonDecode(centre['location']);

              final availableMaps = await MapLauncher.installedMaps;
              print(availableMaps); // [AvailableMap { mapName: Google Maps, mapType: google }, ...]

              await availableMaps.first.showMarker(
                coords: Coords(location['latitude'], location['longitude']),
                title: "Ocean Beach",
              );
            },
            icon: Icon(Icons.location_on,size: 40,),
          )
        ],
      ),
      drawer: AppDrawer(scaffoldKey: _scaffoldKey,),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const SizedBox(height: 100, child: HeaderWidget(100,false,Icons.house_rounded),),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [

                  const Text('', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                 // const Text('', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 5, color: Colors.white),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(color: Colors.black12, blurRadius: 20, offset: Offset(5, 5),),
                            ],
                          ),
                          child: Image.network(centre['image']),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Centre Information",style: const TextStyle(fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic, fontSize: 18,fontFamily: 'ultra' ,color: Colors.black),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Card(
                          child: Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    ...ListTile.divideTiles(
                                      color: Colors.grey,
                                      tiles: [
                                        ListTile(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 4),
                                          leading: Icon(Icons.verified_user,color: Colors.teal,),
                                          title: Text("Centre Name :" ,style: const TextStyle(fontWeight: FontWeight.normal,
                                          fontStyle: FontStyle.italic, fontSize: 13,fontFamily: 'ultra' ,color: Colors.black)),
                                          subtitle: Text(centre['placename'],style: const TextStyle(fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.italic, fontSize: 13,fontFamily: 'ultra' ,color: Colors.black)),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.email,color: Colors.teal,),
                                          title: Text("Email :",style: const TextStyle(fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.italic, fontSize: 13,fontFamily: 'ultra' ,color: Colors.black)),
                                          subtitle: Text(centre['email'],style: const TextStyle(fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.italic, fontSize: 13,fontFamily: 'ultra' ,color: Colors.black)),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.email,color: Colors.teal,),
                                          title: Text("about :",style: const TextStyle(fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.italic, fontSize: 13,fontFamily: 'ultra' ,color: Colors.black)),
                                          subtitle: Text("${centre['description']}",style: const TextStyle(fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.italic, fontSize: 13,fontFamily: 'ultra' ,color: Colors.black)),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.phone,color: Colors.teal,),
                                          title: Text("Phone :" ,style: const TextStyle(fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.italic, fontSize: 13,fontFamily: 'ultra' ,color: Colors.black)),
                                          subtitle: Text("${centre['phone']}",style: const TextStyle(fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.italic, fontSize: 13,fontFamily: 'ultra' ,color: Colors.black)),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.location_on,color: Colors.white,),
                                          title: Text("location :" ,style: const TextStyle(fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.italic, fontSize: 13,fontFamily: 'ultra' ,color: Colors.black)),
                                          subtitle: Text("${jsonDecode(centre['location'])['place']}",style: const TextStyle(fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.italic, fontSize: 13,fontFamily: 'ultra' ,color: Colors.black)),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.medical_services,color: Colors.teal,),
                                          title: Text("MedicalTests",style: const TextStyle(fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.italic, fontSize: 13,fontFamily: 'ultra' ,color: Colors.black)),
                                          subtitle: Text(centre['medicalTests'].toString(),style: const TextStyle(fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.italic, fontSize: 13,fontFamily: 'ultra' ,color: Colors.black)),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.location_city,color: Colors.teal,),
                                          title: Text("branches",style: const TextStyle(fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.italic, fontSize: 13,fontFamily: 'ultra' ,color: Colors.black)),
                                          subtitle: Text(centre['branches'].toString(),style: const TextStyle(fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.italic, fontSize: 13,fontFamily: 'ultra' ,color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                              ],
                            ),

                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text('book'.toUpperCase(), style: const TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'ultra',
                                  color: Colors.white),),
                            ),
                            onPressed: () {
                              Navigator.push(context,MaterialPageRoute(builder: (context) => CentreBranches(current_cenre: centre)));
                            },
                          )
                        ),
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

  // Future createChatRoomIfNotExists({required publisher,required subscriber}) async{
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;
  //   var room = await firestore.collection("rooms").doc("$publisher-$subscriber").get();
  //   if(!room.exists){
  //     firestore.runTransaction((transaction) async {
  //       transaction.set(firestore.collection("rooms").doc("$publisher-$subscriber"), {
  //         'publisher':publisher,
  //         'subscriber':subscriber,
  //         'seen':true,
  //         'readTime':DateTime.now().millisecondsSinceEpoch
  //       });
  //
  //
  //       firestore.collection('rooms').doc("$publisher-$subscriber").collection('messages').doc().set({}); // your answer missing **.document()**  before setData
  //
  //     });
  //   }
  // }
}