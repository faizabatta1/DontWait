/*import 'package:dont_wait/components/background.dart';
import 'package:dont_wait/components/or_divider.dart';
import 'package:flutter/material.dart';
import 'package:dont_wait/Signup//registration_page.dart';

import 'package:dont_wait/components/already_have_an_account_acheck.dart';

import '../constant.dart';


class Body extends StatelessWidget {
  final Widget child;

  const Body(
      {super.key,
        required this.child,
      });

  @override
  Widget build (BuildContext context){
    Size size= MediaQuery.of(context).size;

    return Background(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        Text("SIGNUP",style: TextStyle(
            fontWeight: FontWeight.bold),
        ),
      SizedBox(height: size.height *0.03),
        Image.asset( "assets/image/logo.png", height: size.height *0.1 ,
        ),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          cursorColor: kPrimaryColor,
          onSaved: (value) {},
          decoration: const InputDecoration(
            hintText: "Your ID",
            prefixIcon: Padding(
              padding: EdgeInsets.all(defaultPadding),
              //child: Icon(Icons.person),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: TextFormField(
            textInputAction: TextInputAction.done,
            obscureText: true,
            cursorColor: kPrimaryColor,
            decoration: InputDecoration(
              hintText: "Your password",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(Icons.lock),
              ),
            ),
          ),
        ),

      const SizedBox(height: defaultPadding),
      Hero(
        tag: "login_btn",
        child: ElevatedButton(
          onPressed: () {
            //Navigator.push( context, MaterialPageRoute(builder: (context) =>  LoginScreen()),
            //  );
          },

          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            padding: const EdgeInsets.all(16.0),
            textStyle: const TextStyle(fontSize: 15, fontFamily: 'ultra'),
            fixedSize: Size.fromWidth(120),
            backgroundColor:Color(0xFF009688),

          ),
          child: Text('Sign Up'),
        ),
      ),
        const SizedBox(height: defaultPadding),
        SizedBox(height: size.height *0.03),

         AlreadyHaveAnAccountCheck(
           login: false,
          press: () {
           Navigator.push( context,  MaterialPageRoute( builder: (context) {
                 return SignUpScreen();
               },
           ),
           );
           },
         ),
      OrDivider(),
      ],
    ),
    );
  }
}

*/