/* import 'package:dont_wait/background.dart';
import 'package:dont_wait/components/body.dart';
import 'package:dont_wait/constant.dart';
import 'package:flutter/material.dart';
import 'package:dont_wait/background.dart';
import 'package:dont_wait/constant.dart';
import 'package:dont_wait/Signup/registration_page.dart';
import 'components/login.dart';
import '../splashname.dart';
//import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          Image.asset( "assets/image/logo.png", height: size.height *0.4 ,
          ),
          RoundedButton(size: size),
        ],

      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {  Key? key, required this.size, }) : super(key: key);

  final Size size;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[ ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Column(
            children: <Widget>[

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  LoginScreen()),
                  );
                },

                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(16.0),
                  textStyle: const TextStyle(fontSize: 20, fontFamily: 'ultra'),
                  fixedSize: Size.fromWidth(260),
                  backgroundColor:Color(0xFF009688),

                ),
                child: Text('Login'),
              ),

              const SizedBox(height: 30,),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return SignUpScreen ();
                    },
                    ),

                  );
                },

                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(16.0),
                  textStyle: const TextStyle(fontSize: 20, fontFamily: 'ultra'),
                  fixedSize: Size.fromWidth(260),
                  backgroundColor:Color(0xFF009688),

                ),
                child: Text('Sign Up'),
              ),

            ],


          ),


        ),
        ],
      ),
    );
  }

}
*/