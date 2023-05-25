import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OnetimeUsers extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Panel"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('One time').snapshots(),
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
                        Text("Student Name :"+snapshot.data!.docs[i]['Admission No']),
                        Text("Starting Point :"+snapshot.data!.docs[i]['Departure']),
                        Text("Destination:"+snapshot.data!.docs[i]['Arrival']),
                        Text("expence :"+snapshot.data!.docs[i]['Cost']),
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