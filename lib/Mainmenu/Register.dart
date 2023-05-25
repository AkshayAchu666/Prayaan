import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prayaan/Main_Page/Login.dart';
import 'package:prayaan/main.dart';
import 'package:prayaan/Mainmenu/page3.dart';
import 'package:prayaan/styles.dart';

import '../Qr_/qr_generator.dart';



class register extends StatefulWidget {



  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {




  String _selectedCountry="";
  var country={'Vadakara':'Vad','Payoli':'Pa','Quilandi':'Qu'};

  List _countries=[];
  CountryDependentDropDown(){
    country.forEach((key, value) {
      _countries.add(key);
    });
    _selectedCountry= _countries[0];
  }
  String _selectedState="";

  var state={'One Month':'Vad','Three Month':'Vad','One Year':'Vad','One Month.':'Pa','Three Month.':'Pa','One Year.':'Pa','One Month..':'Qu','Three Month..':'Qu','One Year..':'Qu'};

  List _states=[];
  StateDependentDropDown(countryShortName){
    state.forEach((key, value) {
      if(countryShortName==value){
        _states.add(key);
      }

    });
    _selectedState= _states[0];
  }

  String _selectedCity="";
  var city={'1500':'One Month','3000':'Three Month','7500':'One Year','2000':'One Month.','3500':'Three Month.','8500':'One Year.','2500':'One Month..','4000':'Three Month..','10500':'One Year..'};

  List _cities=[];
  CityDependentDropDown(stateShortName){
    city.forEach((key, value) {
      if(stateShortName==value){
        _cities.add(key);
      }

    });
    _selectedCity= _cities[0];
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CountryDependentDropDown();
  }
  var dropdownValue;
  var dropdownValue1;
  var dropdownValue2;
  var dropdownValue3;
  TextEditingController AdmissionNocontroller= new TextEditingController();




  @override
  bool _obscuretext = false;
  IconData id = Icons.visibility_off;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Register', style: TextStyle(fontSize:22,color: Colors.black),),
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
                        children: [SizedBox(
                          width: 350,
                          child: TextFormField(
                              controller: AdmissionNocontroller,
                              style: inputstyle(),
                              // controller: uc.uname,
                              decoration:
                              inputdec("Admission", Icons.person_outline)),),
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
                                hint: Text(_selectedCountry!=null?_selectedCountry:"Select Your Year",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                onChanged: (newValue){
                                  setState(() {
                                    _cities=[];
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

                                hint: Text(_selectedState!=null?_selectedState:"Select Your Branch",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                onChanged: (newValue){
                                  print(newValue);
                                  setState(() {
                                    print(newValue);
                                    _cities=[];
                                    CityDependentDropDown(newValue);

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
                            height: 20,),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Theme.of(context).primaryColor)),

                            width: 350,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                hint: Text(_selectedCity!=null?_selectedCity:"Select Your Branch",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                onChanged: (newValue){
                                  print(newValue);
                                  setState(() {
                                    print(newValue);
                                    _selectedCity="$newValue";
                                  });

                                },
                                isExpanded: true,
                                iconSize: 36,
                                icon: Icon(Icons.arrow_drop_down, color: Colors.black,),
                                items:_cities.map((state){
                                  return DropdownMenuItem(
                                    child: new Text(state),
                                    value:state,
                                  );
                                }).toList(),


                              ),),
                          ),
                          SizedBox(height: 20,),
                          MaterialButton(
                            child: Text(
                              'Create',
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
                            onPressed: () {
                              showDialog(
                                context: context, barrierDismissible: false,
                                builder: (context) => Center(child: CircularProgressIndicator()),
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>
                                    GenerateQR()),
                              );
                              Map <String,dynamic> data= {"Admission No":AdmissionNocontroller.text,"Destination":_selectedCountry,
                                "Duration":_selectedState,"Cost":_selectedCity};
                              final docUser= FirebaseFirestore.instance.collection('Registered Students').doc();
                              docUser.set(data);
                            },

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