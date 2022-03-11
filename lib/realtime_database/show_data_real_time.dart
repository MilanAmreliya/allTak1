import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class RealTimeShowData extends StatefulWidget {
  @override
  _RealTimeShowDataState createState() => _RealTimeShowDataState();
}

class _RealTimeShowDataState extends State<RealTimeShowData> {
  final databaseRef = FirebaseDatabase.instance.reference();
  var _firebaseRef = FirebaseDatabase().reference().child('milanData');

  void printFirebase() {
    databaseRef.once().then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
    });
  }

  @override
  Widget build(BuildContext context) {
    var comments = _firebaseRef.orderByChild('time').limitToLast(10);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            MaterialButton(
              color: Colors.deepOrange,
              child: Text('sdfsdfs'),
              onPressed: () {
                printFirebase();
              },
            ),
            StreamBuilder(
              stream: comments.onValue,
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Text('${snapshot.data}');
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
