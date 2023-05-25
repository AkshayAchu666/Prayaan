import 'package:flutter/material.dart';
import 'package:prayaan/Main_Page/SignIn.dart';
import 'package:prayaan/Mainmenu/Page3.dart';
import 'package:flutter/material.dart';

import 'package:prayaan/styles.dart';

class forgetpassword extends StatefulWidget {
  const forgetpassword({Key? key}) : super(key: key);

  @override
  State<forgetpassword> createState() => _ForgetpasswordPageState();
}

class _ForgetpasswordPageState extends State<forgetpassword> {
  var email_namecontroller= TextEditingController();
  @override
  // Bool _obscuretext=false;
  bool _obscuretext = false;
  IconData id = Icons.visibility_off;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password', style: TextStyle(fontSize: 12,color: Colors.black),),
        backgroundColor: Colors.grey,
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
                    child: TextFormField(
                      controller: email_namecontroller,
                      style: inputstyle(),
                      // controller: uc.uname,
                      decoration:
                      InputDecoration(labelText: 'Your Email'),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),


                  SizedBox(
                    height: 50,
                  ),
                  MaterialButton(
                      child: Text(
                        "Forget Password",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.blue[600],
                      minWidth: 160,
                      onPressed: () { Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Mainmenu()),
                      );

                      }

                  ),

                ]),
          ),
        ),
      ),
    );
  }
}