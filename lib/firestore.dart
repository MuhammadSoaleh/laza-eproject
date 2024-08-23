import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices{
  //get collection of data
final CollectionReference contactus =FirebaseFirestore.instance.collection("Contactus");
  //create/insert a new data
Future<void> addmessage(String email,String message){
  return contactus.add({
'Email':email,
'Message':message,
'timeStamp':Timestamp.now()
  });
}
  //read/fetch all data

  // delete existing
}