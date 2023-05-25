import 'package:flutter/material.dart';
import 'package:prayaan/Location.dart';
import 'package:prayaan/Main_Page/Login.dart';
import 'package:prayaan/styles.dart';



class payment extends StatefulWidget {
  const payment({Key? key}) : super(key: key);

  @override
  State<payment> createState() => _LoginPageState();
}

class _LoginPageState extends State<payment> {
  var User_namecontroller= TextEditingController();
  var Coursecontroller= TextEditingController();
  var Yearcontroller= TextEditingController();
  var Brachcontroller= TextEditingController();
  var Semestercontroller= TextEditingController();


  @override
  // Bool _obscuretext=false;
  bool _obscuretext = false;
  IconData id = Icons.visibility_off;
  Widget build(BuildContext context) {
    return Scaffold(
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
                  SizedBox(
                    child: Image(
                      image: AssetImage('images/logo1.jpg'),),
                    height: 200,),
                  SizedBox(
                    height: 40,),
                  SizedBox(
                    width: 350,
                    child: TextField(
                        controller: User_namecontroller,
                        style: inputstyle(),
                        // controller: uc.uname,
                        decoration:
                        inputdec("Username", Icons.person_outline)),),
                  SizedBox(
                    height: 20,),
                  SizedBox(
                    width: 350,
                    child: TextField(
                        controller: Coursecontroller,
                        style: inputstyle(),
                        // controller: uc.uname,
                        decoration:
                        inputdec("Course", Icons.person_outline)),),
                  SizedBox(
                    height: 20,),
                  SizedBox(
                    width: 350,
                    child: TextField(
                        controller: Yearcontroller,
                        style: inputstyle(),
                        // controller: uc.uname,
                        decoration:
                        inputdec("Year", Icons.person_outline)),),
                  SizedBox(
                    height: 20,),
                  SizedBox(
                    width: 350,
                    child: TextField(
                        controller: Brachcontroller,
                        style: inputstyle(),
                        // controller: uc.uname,
                        decoration:
                        inputdec("Branch", Icons.person_outline)),),
                  SizedBox(
                    height: 20,),
                  SizedBox(
                    width: 350,
                    child: TextField(
                        controller: Semestercontroller,
                        style: inputstyle(),
                        // controller: uc.uname,
                        decoration:
                        inputdec("Semester", Icons.person_outline)),
                  ),
                  SizedBox(
                    height: 20,),
                  MaterialButton(
                    child: Text(
                      "Create",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.blue[600],
                    minWidth: 160,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              LoginPage())); LocationService();

                    },

                  ),
                  SizedBox(
                    height: 14,),


                ]),
          ),
        ),
      ),
    );
  }
}