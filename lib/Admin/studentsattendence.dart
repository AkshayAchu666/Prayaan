import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Attendence extends StatelessWidget {


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Panel"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Student Register').snapshots(),
        builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, i){
                  return Container(
                    width: 200,
                    height: 100,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    color: Colors.green.shade300,


                    child: Column(
                      children: [
                        Text("Student Name  :"+snapshot.data!.docs[i]['User Id']),
                        Text("Last Closed at  :"+snapshot.data!.docs[i]['Signout Location']),
                      ],
                    ),
                  );

                });
          }
          else{
            return CircularProgressIndicator();
          }
        },
      ),

    );
  }
}