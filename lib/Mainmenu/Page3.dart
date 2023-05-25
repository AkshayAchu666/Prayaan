import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prayaan/Main_Page/Login.dart';
import 'package:prayaan/Mainmenu/Register.dart';
import 'package:prayaan/Mainmenu/Advance_payment.dart';

import 'package:prayaan/Mainmenu/profile.dart';
import 'package:prayaan/Mainmenu/wallet.dart';
import 'package:prayaan/Onetime/onetime.dart';
import 'package:prayaan/Qr_/qr_generator.dart';
import 'package:prayaan/Qr_/qr_scan.dart';


import '../Qr_/userMangement.dart';
import '../payment.dart';


class Mainmenu extends StatefulWidget {
  const Mainmenu({Key? key}) : super(key: key);
  @override
  State<Mainmenu> createState() => _LoginPageState();
}

class _LoginPageState extends State<Mainmenu> {

  var _latitude ="";
  var _longitude ="";
  var _altitude="";
  var _speed ="";
  var _address = "";

  Future<void>_updatePosition() async {
    Position pos = await _determinePosition();
    List pm = await placemarkFromCoordinates(pos.latitude, pos.longitude);
    setState(() {
      _latitude = pos.latitude.toString();
      _longitude = pos.longitude.toString();
      _altitude = pos.altitude.toString();
      _speed = pos.speed.toString();
      _address = pm[0].toString();
    });
  }
  Future <Position>_determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          "Location permissions are permanently denied,we cannot request permissions.");
    }
    return await Geolocator.getCurrentPosition();
  }



  String Prayaan = 'FirebaseAuth.instance.currentUser!';

  @override
  // Bool _obscuretext=false;
  bool _obscuretext = false;
  IconData id = Icons.visibility_off;

  Widget build(BuildContext context) {
    return(
        Scaffold(
          appBar: AppBar(
            title: const Text('Main Menu', style: TextStyle(fontSize: 22,color: Colors.black54),),
            backgroundColor: Colors.grey,
          ),
          drawer: const NavigationDrawer(),
          resizeToAvoidBottomInset: false,
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/bg.jpg'),
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(0.6), BlendMode.color),
                    fit: BoxFit.fill,
                  )),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [


                      MaterialButton(
                        onPressed: () { Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => QRreader()),
                        );
                        },
                        child: Text(
                          'Qr Scanner',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'SFUIDisplay',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        color: Theme.of(context).primaryColor, //Color(0xffff2d55),
                        elevation: 10,
                        minWidth: 300,
                        height: 50,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.white),),



                      ),
                      SizedBox(
                        height: 50,
                      ),

                      MaterialButton(
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'SFUIDisplay',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        color: Theme.of(context).primaryColor, //Color(0xffff2d55),
                        elevation: 10,
                        minWidth: 300,
                        height: 50,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.white),),

                        onPressed: (){ Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => register()),
                        );
                        },
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      MaterialButton(
                        child: Text(
                          'Wallet',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'SFUIDisplay',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        color: Theme.of(context).primaryColor, //Color(0xffff2d55),
                        elevation: 10,
                        minWidth: 300,
                        height: 50,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.white),),

                        onPressed: () { Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Paymentsection()),
                        );
                        },
                      ), SizedBox(
                        height: 50,
                      ),

                      MaterialButton(
                        onPressed: () { Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Onetime()),
                        );
                        },
                        child: Text(
                          'One Time Drive',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'SFUIDisplay',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        color: Theme.of(context).primaryColor, //Color(0xffff2d55),
                        elevation: 10,
                        minWidth: 300,
                        height: 50,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.white),),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      MaterialButton(
                        child: Text(
                          'Reached Destination',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'SFUIDisplay',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        color: Theme.of(context).primaryColor, //Color(0xffff2d55),
                        elevation: 10,
                        minWidth: 300,
                        height: 50,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.white),),
                        onPressed: () { Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => QRreader1()),
                        );
                        },

                      ),

                    ]),
              ),
            ),
          ),
        ));
  }
}
final user =FirebaseAuth.instance.currentUser!;
class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) =>
      Drawer(
          backgroundColor: Colors.greenAccent,

          child:  SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  child:  CircleAvatar(),
                  color: Colors.tealAccent,),
                buildMenuItems(context),
              ],
            ),
          )
      );

  Widget buildMenuItems(BuildContext context) => Wrap(
      runSpacing: 16,
      children:[
        SizedBox(
          height: 20,
        ),
        SizedBox(
          child: Image(

              image: AssetImage('images/pic2.jpg')),
          height: 200,),
        SizedBox(
          height: 200,
        ),

        SizedBox(height: 200,),
        SizedBox(
          child: Row(
            children: [
              Text('User Id  :  ', style: TextStyle(
                fontSize: 20,
                fontFamily: 'SFUIDisplay',
                fontWeight: FontWeight.bold,
              ),),
              Text(user.email!, style: TextStyle(
                fontSize: 20,
                fontFamily: 'SFUIDisplay',
                fontWeight: FontWeight.bold,
              ),),

            ],
          ),
        ),
        SizedBox(
            height: 50
        ),


        ListTile(
          leading: const Icon(Icons.edit),
          title: Text(
            'Profile',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'ubuntu',
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: (){Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => profile()),
          );},
        ),
        const Divider(color:  Colors.black),
        ListTile(
            leading: const Icon(Icons.output_outlined),
            title:  Text("Sign Out", style: TextStyle(
              fontSize: 20,
              fontFamily: 'avenir',
              fontWeight: FontWeight.bold,
            ),),
            onTap: () =>{showDialog(context: context, builder: (context){
              return AlertDialog(
                title: Text("Sign Out"),
                actions: [
                  TextButton(onPressed: ()=> {
                    FirebaseAuth.instance.signOut(),
                    Navigator.push(context,MaterialPageRoute(builder: (context) => LoginPage())
                    ),

                  },
                    child: Text("yes"),),
                  TextButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Mainmenu()),
                    );
                  },
                    child: Text("No"),)
                ],

              );

            },
            ),}),



      ]
  );

}
