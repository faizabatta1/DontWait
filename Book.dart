
import 'package:dont_wait/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'branchCentres.dart';
import 'home_screen.dart';


void main() {
  runApp(Book());
}

class Book extends StatelessWidget {
  // This widget is the root of your application.
  List<String> cities = [
    "Nablus",
    "Qalqilya",
    "Jenin",
    "Tulkarm",
    "Jerusalem",
    "Gaza",
    "Hebron",
    "Bethlehem",
    "Ramaallah"
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(cities: cities),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<String> cities;
  const MyHomePage({ Key? key, required this.cities }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text( 'Choose City:', style: TextStyle(fontSize: 20, fontFamily: 'ultra',
            color: Colors.white),
        ),
        leading: GestureDetector(
          onTap: () { /* Write listener code here */ },
          child: IconButton(
            icon : Icon(
              Icons.arrow_back,
              size: 26.0,color: Colors.white,
            ),

            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));},

          ),
        ),

      ),
      body:

      Container(child: Padding(
        padding: const EdgeInsets.all(30.0),

        child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10)
            , itemBuilder: (context,index){
            return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>BranchCentres(city:cities[index])));
            },
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: index % 2 == 0 ? Colors.teal : Colors.teal,),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(index % 2 == 0 ? Icons.location_city : Icons.place,size: 50,color: Colors.white,),
                  Text(cities[index],style: TextStyle(color: Colors.white,fontSize: 30),),
                ],),
            ),
          );
          },
            itemCount: cities.length,
        ),
      ),),
    );

  }

}
