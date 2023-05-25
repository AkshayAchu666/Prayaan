import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prayaan/Admin/studentprofile.dart';
import 'package:prayaan/Admin/studentsattendence.dart';
import 'package:prayaan/Main_Page/Login.dart';

import '../Mainmenu/profile.dart';
import '../Onetime/onetime.dart';
import 'Registerationdetails.dart';
import 'original.dart';


class Admin_pannel extends StatefulWidget {
  const Admin_pannel({Key? key}) : super(key: key);
  @override
  State<Admin_pannel> createState() => _Admin_pannelState();
}

class _Admin_pannelState extends State<Admin_pannel> {




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
                          MaterialPageRoute(builder: (context) => Registerations()),
                        );
                        },
                        child: Text(
                          'Registered Students ',
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
                          'Students Profile',
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
                          MaterialPageRoute(builder: (context) => Studentprofile()),
                        );
                        },
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      MaterialButton(
                        child: Text(
                          'One Time Users',
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
                          MaterialPageRoute(builder: (context) => OnetimeUsers()),
                        );
                        },
                      ), SizedBox(
                        height: 50,
                      ),

                      MaterialButton(
                        onPressed: () { Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => profile()),
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
                          'Student Catlog',
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
                          MaterialPageRoute(builder: (context) => Attendence()),
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
          onTap: (){},
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
                      MaterialPageRoute(builder: (context) => Admin_pannel()),
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
