import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prayaan/Mainmenu/Page3.dart';

import '../styles.dart';




class Onetime extends StatefulWidget {

  @override
  _OnetimeState createState() => _OnetimeState();
}

class _OnetimeState extends State<Onetime> {
  TextEditingController AdmissionNocontroller= new TextEditingController();
  String _selectedCountry="Vadakara";
  var country={'Vadakara':'Vad','Payoli':'Pa','Quilandi':'Qu','College':'Clg'};

  List _countries=[];
  CountryDependentDropDown(){
    country.forEach((key, value) {
      _countries.add(key);
    });
  }

  String _selectedState="Departure";

  var state={'college':'Vad','college.':'Pa','College.':'Qu','vadakara':'Clg','payoli':'Clg','quilandi':'Clg'};

  List _states=[];
  StateDependentDropDown(countryShortName){
    state.forEach((key, value) {
      if(countryShortName==value){
        _states.add(key);
      }

    });
    _selectedState= _states[0];
  }

  String _selectedCity="Cost";
  var city={'30':'college','40':'college.','50':'College.','20':'vadakara','35':'payoli','45':'quilandi'};

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
  @override

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("OnetimeUse"),
        backgroundColor: Colors.grey,
      ),
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          margin:EdgeInsets.all(15),

          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 40,),
              SizedBox(


                width: 400,
                child: TextFormField(
                    controller: AdmissionNocontroller,
                    style: inputstyle(),
                    // controller: uc.uname,
                    decoration:
                    inputdec("Admission No", Icons.person_outline)),
              ),
              SizedBox(height: 10,),


              Align(
                alignment: Alignment.centerLeft,
                child:Text("Departure",  style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18),),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 22, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Theme.of(context).primaryColor)),
                width: 400,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: _selectedCountry,
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
              SizedBox(height: 10,),

              Align(
                  alignment: Alignment.centerLeft,
                  child:Text("Arrival", style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18),)
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 22, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Theme.of(context).primaryColor)),

                width: 400,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(

                    value: _selectedState,
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
              SizedBox(height: 10,),

              Align(
                  alignment: Alignment.centerLeft,
                  child:Text("Traveling cost", style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18),)
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 22, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Theme.of(context).primaryColor)),

                  width: 400,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(

                      value: _selectedCity,
                      onChanged: (newValue){
                        print(newValue);
                        setState(() {
                          _selectedCity="$newValue";
                        });

                      },
                      isExpanded: true,
                      iconSize: 36,
                      icon: Icon(Icons.arrow_drop_down, color: Colors.black,),
                      items:_cities.map((city){
                        return DropdownMenuItem(
                          child: new Text(city),
                          value:city,
                        );
                      }).toList(),
                    ),
                  )


              ),
              SizedBox(height: 40,),

              MaterialButton(
                child: Text(
                  'BookMy Trip',
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
                    MaterialPageRoute(builder: (context) => Mainmenu()),
                  );
                  Map <String,dynamic> data= {"Admission No":AdmissionNocontroller.text,"Departure":_selectedCountry,
                    "Arrival":_selectedState,"Cost":_selectedCity};
                  final docUser= FirebaseFirestore.instance.collection('One time').doc(user.uid);
                  docUser.set(data);
                },

              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}