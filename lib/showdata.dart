import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crudpractice_own/database_services.dart';
import 'package:crudpractice_own/edit_data.dart';
import 'package:crudpractice_own/navigationss.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowData extends StatefulWidget {
  ShowData({Key? key}) : super(key: key);

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Showing Data'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('notes').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    DataBaseServices.deleData(snapshot.data!.docs[index].id);
                    Fluttertoast.showToast(
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        msg: '${snapshot.data!.docs[index]['title']} deleted');
                  },
                  background: Container(
                    color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  child: InkWell(
                    onDoubleTap: () {
                      Navigationss.navigator(
                        context,
                        EditData(
                          title: snapshot.data!.docs[index]['title'],
                          detail: snapshot.data!.docs[index]['detail'],
                          id: snapshot.data!.docs[index].id,
                        ),
                      );
                    },
                    child: Card(
                      child: ExpansionTile(
                        expandedAlignment: Alignment.centerLeft,
                        title: Text(
                          snapshot.data!.docs[index]['title'],
                        ),
                        children: [
                          Text(
                            snapshot.data!.docs[index]['detail'],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
