import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Studentprofile extends StatelessWidget{
  const Studentprofile({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Panel"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Profile').snapshots(),
        builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context,i){
                  return Container(
                    width: 200,
                    height: 100,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    color: Colors.green.shade300,
                    child: Column(
                      children: [
                        Text("Student Name :"+snapshot.data!.docs[i]['UserName']),
                        Text("Course :"+snapshot.data!.docs[i]['Course']),
                        Text("Branch :"+snapshot.data!.docs[i]['Branch']),
                        Text("Year :"+snapshot.data!.docs[i]['Year']),
                        Text("Semester :"+snapshot.data!.docs[i]['Semester']),
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