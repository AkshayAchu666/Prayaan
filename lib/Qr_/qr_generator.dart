import 'package:flutter/material.dart';
import 'package:prayaan/Main_Page/Login.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:prayaan/Mainmenu/page3.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path_provider/path_provider.dart';

class GenerateQR extends StatefulWidget {

  @override
  uploadFile()async{}
  generateqr createState() => generateqr();
}

class generateqr extends State<GenerateQR> {

  final User_namecontroller = TextEditingController();
  String qrdataFeed = "";
  String qrData = user.email!;
  updatePhoto(user,  qrData) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child('path').child('/.jpg');
    UploadTask uploadTask = ref.putFile(qrData);
    String url;
    uploadTask.whenComplete(() async {
      url = await ref.getDownloadURL();
    }).catchError((onError) {
      print(onError);
    });
    return  ;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Appbar having title
      appBar: AppBar(
        title: const Text('QR Generator', style: TextStyle(fontSize: 12,color: Colors.black),),
        backgroundColor: Colors.grey,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(

          //Scroll view given to Column
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              QrImage(data: qrdataFeed.toString()),
              Text(
                  qrdataFeed= User_namecontroller.text),
              SizedBox(height: 20),
              //TextField for input link
              Padding(
                padding: const EdgeInsets.all(8.0),
                //Button for generating QR code
                child: MaterialButton(
                  onPressed: () {
                    updatePhoto(user,  qrData) ;

                    showDialog(
                      context: context, barrierDismissible: false,
                      builder: (context) => Center(child: CircularProgressIndicator()),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Mainmenu()),
                    );
                    Map <String,dynamic> data= {"UserName":user.email!,"qrdata":qrData,
                      "qrdataFeed":qrdataFeed.toString(),};
                    final docUser= FirebaseFirestore.instance.collection('Qr Data').doc('qr');
                    docUser.set(data);
                  },
                  //Title given on Button
                  child: Text("Generate QR Code",style: TextStyle(color: Colors.indigo[900],),),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Color(45)),
                  ),
                ),


              ),

            ],
          ),
        ),
      ),
    );
  }
}