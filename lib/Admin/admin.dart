
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prayaan/Admin/original.dart';
import 'package:prayaan/Admin/studentprofile.dart';
import 'package:prayaan/styles.dart';

import 'Pannel.dart';
import 'Registerationdetails.dart';


class AdminloginPage extends StatefulWidget {

  @override
  State<AdminloginPage> createState() => _AdminloginPageState();
}

class _AdminloginPageState extends State<AdminloginPage> {
  // ignore: non_constant_identifier_names
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final navigatorKey = GlobalKey<NavigatorState>();
  final User_namecontroller = TextEditingController();
  final Passwordcontroller = TextEditingController();
  late final allData;
  toast2(String a) => showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      elevation: 3,
      title: Text(
        a,
        textAlign: TextAlign.center,
      ),
      content: Icon(
        Icons.remove_circle_outline,
        size: 80,
        color: Colors.red,
      ),
    ),
  );

  @override
  void dispose() {
    User_namecontroller.dispose();
    Passwordcontroller.dispose();
    super.dispose();

  }
  @override


  // Bool _obscuretext=false;
  bool _obscuretext = false;
  IconData id = Icons.visibility_off;

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin', style: TextStyle(fontSize: 22,color: Colors.white),),
        backgroundColor: Colors.blueAccent,
      ),
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/bg1.jpeg'),
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.6), BlendMode.color),
                fit: BoxFit.fill,
              )),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(
                    height: 300,
                  ),
                  SizedBox(
                    width: 350,
                    child: TextField(
                        controller: User_namecontroller,
                        style: inputstyle(),
                        // controller: uc.uname,
                        decoration:
                        inputdec("Username", Icons.person_outline)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 350,
                    child: TextField(
                      controller: Passwordcontroller,
                      obscureText: _obscuretext,
                      style: inputstyle(),
                      // controller: uc.pwd,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              icon: Icon(id),
                              color: Colors.black,
                              onPressed: () {
                                setState(() {
                                  _obscuretext = !_obscuretext;
                                  if (_obscuretext)
                                    id = Icons.visibility;

                                  else
                                    id = Icons.visibility_off;
                                });
                              }),
                          fillColor: Colors.white,
                          filled: true,
                          border: new OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.cyan)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.black)),
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 16, // or whatever
                            color: Colors.grey,
                            height:
                            2.2, //                                <----- this was the key
                          ),
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            size: 20,
                            color: Colors.black,
                          ),
                          contentPadding: EdgeInsets.all(0),
                          isDense: false,
                          hintText: "Password"),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  // ignore: deprecated_member_use
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: MaterialButton(
                      onPressed: () async {
                        try {
                          await FirebaseFirestore.instance.collection('admin').doc('adminLogin').snapshots().forEach((element) {
                            if(element.data()?['adminEmail'] == User_namecontroller.text && element.data()?['adminPassword'] == Passwordcontroller.text){
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Admin_pannel()), (route) => false);
                            }

                          });

                        } catch(e){
                          Navigator.pop(context);
                          builder: (context){
                            return AlertDialog(
                              title: Text("Your Not The Admin"),
                              content: Text(e.toString()),
                            );
                          };
                        }
                      }, //since this is only a UI app

                      child: Text(
                        'Admin Login',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'SFUIDisplay',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Colors.cyan, //Color(0xffff2d55),
                      elevation: 2,
                      minWidth: 350,
                      height: 40,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),]),),),),);
  }}