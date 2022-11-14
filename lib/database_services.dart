import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore myFirebaseFirestore = FirebaseFirestore.instance;

class DataBaseServices {
  static Future<void> addData(
      String title, String detail, String collecname) async {
    await myFirebaseFirestore.collection(collecname).add({
      "title": title,
      "detail": detail,
    }).whenComplete(() {
      print('Added Successfully');
    }).catchError((error, stackTrace) {
      print('Some Error Occured');
    });
  }
  //
  // Deleting Data from database
  //

  static Future<void> deleData(String id) async {
    await myFirebaseFirestore
        .collection('notes')
        .doc(id)
        .delete()
        .whenComplete(() => print('Deleted Successfull'))
        .onError((error, stackTrace) => print('Donot Deleted'));
  }
}
