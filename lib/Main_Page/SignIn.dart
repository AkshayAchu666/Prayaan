import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prayaan/Main_Page/Login.dart';
import 'package:prayaan/Mainmenu/profile.dart';
import 'package:prayaan/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:intl/intl.dart';


class Create extends StatefulWidget {


  @override
  State<Create> createState() => _CreatePageState();
}

class _CreatePageState extends State<Create> {

  bool isLogin = true;

  final User_namecontroller = TextEditingController();
  final Passwordcontroller = TextEditingController();




  @override
  //void initState(){
  // FirebaseAuth.instance.currentUser()
  //    .then((value)){

  // Firestore.instance.collection('user')
  //    .where('uid',isEqualTo: val.uid)
  //    .getDocument()
  //    .then((userDocs){
  //  setState((){
  //     User_namecontroller = userDocs.documents[0].data['User name'];
  //    User_namecontroller = userDocs.documents[0].data['User name'];
//    User_namecontroller = userDocs.documents[0].data['User name'];
//    }

//        }
//      };
  //  };
  // Bool _obscuretext=false;
  bool _obscuretext = false;
  IconData id = Icons.visibility_off;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In', style: TextStyle(fontSize: 22,color: Colors.white),),
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
                    height: 150,
                  ),

                  SizedBox(),

                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      controller: User_namecontroller,
                      style: inputstyle(),
                      // controller: uc.uname,
                      decoration:
                      inputdec("Username", Icons.person_outline),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                          ? 'Enter a valid email'
                          : null,
                    ),),
                  SizedBox(
                    height: 20,),

                  SizedBox(
                    width: 350,
                    child: TextFormField(
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
                                    id = Icons.visibility_off;
                                  else
                                    id = Icons.visibility;
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
                          isDense: true,
                          hintText: "Password"),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) =>
                      value != null && value.length < 6
                          ? 'Enter min 6 characters'
                          : null,

                    ),
                  ),
                  SizedBox(
                    height: 20,),
                  SizedBox(
                    height: 20,),
                  MaterialButton(

                    onPressed: Create,
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 21,
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
                  SizedBox(
                    height: 14,),


                ]),
          ),
        ),
      ),
    );
  }
  DropdownMenuItem<String>buildMenuItem(String item) =>
      DropdownMenuItem(value: item,
          child: Text(
              item,
              style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 20)));

  Future Create() async{
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),

    );
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: User_namecontroller.text.trim(),
        password: Passwordcontroller.text.trim(),
      );
    }
    on FirebaseAuthException catch (e){
      print(e);
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => profile()),);
  }
}
