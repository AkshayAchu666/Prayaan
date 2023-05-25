import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prayaan/Main_Page/Login.dart';
import 'package:prayaan/Mainmenu/page3.dart';
import 'package:prayaan/styles.dart';

import '../Qr_/qr_generator.dart';



class profile extends StatefulWidget {

  @override
  State<profile> createState() => _profilePageState();
}

class _profilePageState extends State<profile> {
  final Course = ['BTech', ];
  final Branch = ['ECE','EEE','CSE','CIVIL','IT' ];


  String _selectedCountry='select your year';
  var country={'First Year':'one','Secound Year':'two','Third Year':'three','Fourth Year':'four'};

  List _countries=[];
  CountryDependentDropDown(){
    country.forEach((key, value) {
      _countries.add(key);
    });
    _selectedCountry= _countries[0];
  }

  String _selectedState="";

  var state={'Semster 1':'one','Semester 2':'one','Semester 3':'two','Semester 4':'two','Semester 5':'three','Semester 6':'three','Semester 7':'four','Semester 8':'four',};

  List _states=[];
  StateDependentDropDown(countryShortName){
    state.forEach((key, value) {
      if(countryShortName==value){
        _states.add(key);
      }

    });
    _selectedState= _states[0];
  }

  String? value;
  var dropdownValue;
  var dropdownValue1;
  var dropdownValue2;
  var dropdownValue3;
  TextEditingController UserNamecontroller= new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CountryDependentDropDown();
  }

  @override
  bool _obscuretext = false;
  IconData id = Icons.visibility_off;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create Profile', style: TextStyle(fontSize: 22,color: Colors.black),),
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
                      image: AssetImage('images/bg.jpg'),
                      colorFilter: new ColorFilter.mode(
                          Colors.black.withOpacity(0.6), BlendMode.color),
                      fit: BoxFit.fill,
                    )),
                child: Center(
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 350,
                            child: TextFormField(
                                controller: UserNamecontroller,
                                style: inputstyle(),
                                // controller: uc.uname,
                                decoration:
                                inputdec("Your Name", Icons.person_outline)),),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 350,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 22, vertical: 5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Theme.of(context).primaryColor)),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  hint: Text(dropdownValue!=null?dropdownValue:"Select Your Course",
                                    style: TextStyle(color: Colors.grey),
                                  ),

                                  isExpanded: true,
                                  iconSize: 36,
                                  icon: Icon(Icons.arrow_drop_down, color: Colors.black,),
                                  items: Course.map(buildMenuItem).toList(),
                                  onChanged: (value)=> setState(() => this.dropdownValue = value),
                                ),),),),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width:350,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 22, vertical: 5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Theme.of(context).primaryColor)),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  hint: Text(dropdownValue1!=null?dropdownValue1:"Select Your Branch",
                                    style: TextStyle(color: Colors.grey),
                                  ),


                                  isExpanded: true,
                                  iconSize: 36,
                                  icon: Icon(Icons.arrow_drop_down, color: Colors.black,),
                                  items:Branch.map(buildMenuItem).toList(),
                                  onChanged: (value)=> setState(() => this.dropdownValue1 = value),
                                ),
                              ),),),
                          SizedBox(
                            height: 20,
                          ),

                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Theme.of(context).primaryColor)),
                            width: 350,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                value: _selectedCountry,
                                onChanged: (newValue){
                                  setState(() {
                                    _states=[];
                                    StateDependentDropDown(country[newValue]);
                                    _selectedCountry="$newValue";
                                  });

                                },
                                isExpanded: true,
                                iconSize: 36,
                                icon: Icon(Icons.arrow_drop_down, color: Colors.black,),
                                items:_countries.map((country){
                                  return DropdownMenuItem(
                                    child: new Text(country),
                                    value:country,
                                  );
                                }).toList(),

                              ),
                            ),),


                          SizedBox(
                            height: 20,
                          ),

                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Theme.of(context).primaryColor)),

                            width: 350,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                value: _selectedState,
                                onChanged: (newValue){
                                  print(newValue);
                                  setState(() {
                                    print(newValue);
                                    _selectedState="$newValue";
                                  });

                                },
                                isExpanded: true,
                                iconSize: 36,
                                icon: Icon(Icons.arrow_drop_down, color: Colors.black,),
                                items:_states.map((state){
                                  return DropdownMenuItem(
                                    child: new Text(state),
                                    value:state,
                                  );
                                }).toList(),


                              ),),
                          ),
                          SizedBox(
                            height: 50,),
                          MaterialButton(
                            onPressed: () {
                              showDialog(
                                context: context, barrierDismissible: false,
                                builder: (context) => Center(child: CircularProgressIndicator()),
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => GenerateQR()),
                              );
                              Map <String,dynamic> data= {"UserName":UserNamecontroller.text,"Course":dropdownValue,
                                "Branch":dropdownValue1,"Year":_selectedCountry,"Semester":_selectedState};
                              final docUser= FirebaseFirestore.instance.collection('Profile').doc(user.email);
                              docUser.set(data);
                            },
                            child: Text(
                              'Create Profile',
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
                            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                          ),
                        ])))
        )
    );}
  DropdownMenuItem<String>buildMenuItem(String item) =>
      DropdownMenuItem(value: item,
          child: Text(
              item,
              style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 20)));
}