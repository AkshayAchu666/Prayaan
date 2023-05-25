import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:prayaan/Mainmenu/Register.dart';
import 'Mainmenu/Page3.dart';



class Paymentsection extends StatefulWidget {
  @override
  _PaymentsectionState createState() => _PaymentsectionState();
}
class _PaymentsectionState extends State<Paymentsection>{


  late Razorpay razorpay;
  var Cost;
  TextEditingController textEditingController =new TextEditingController();
  @override
  void initState() {
    super.initState();

    razorpay = new Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }
  @override
  void dispose(){

    super.dispose();
    razorpay.clear();
  }
  void handlerPaymentSuccess(){
    print("Payment Success");
  }
  void handlerErrorFailure(){
    print("Payment Error");
  }
  void handlerExternalWallet(){
    Text("External Wallet");
  }

  void openCheckout(){
    var options ={
      "key":"rzp_test_w59CSADltbJfWi",
      "amount":textEditingController.text,
      "name": user.email,
      "description":"Payment for your registeration",
      "prefill":{
        "contact":"8589006333",
        "emailid":user.email
      },
      "external":{
        "wallet":["paytm","phonepe"]
      }
    };
    try{
      razorpay.open(options);

    }catch(e){
      print(e.toString());
    }

  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text("Payment Section"),
        ),
        body:Padding(
          padding: const EdgeInsets.all(30.0),



          child:Column(
            children: [
              StreamBuilder(stream: FirebaseFirestore.instance.collection('Registered Students').snapshots(),
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
                                  Cost=Text("pay:"+snapshot.data!.docs[i]['Cost']),

                                ]),
                          );

                        });
                  }
                  else{
                    return CircularProgressIndicator();
                  }
                },),
              Text("3000"

              ),
              SizedBox(height: 10,),
              MaterialButton(
                  child: Text("Pay"),
                  onPressed: (){
                    openCheckout();
                  })
            ],
          ),


        ));
  }


}